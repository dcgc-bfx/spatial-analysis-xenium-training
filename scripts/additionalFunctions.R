# If we do not want to analyze the data, we need to copy "counts" into the "data" layer. 
# Function copied from: 
# https://github.com/dcgc-bfx/scrnaseq2/blob/main/R/functions_analysis.R#L512
TransformData = function(sc, assay=NULL, layer="counts", save="data", log=FALSE) {
  if (is.null(assay)) assay = Seurat::DefaultAssay(sc)
  
  # Iterate over layers (datasets) and get size factors
  olayers = layers = unique(layer)
  layers = SeuratObject::Layers(sc[[assay]], layer)
  if (length(save) != length(layers)) {
    save = make.unique(names=gsub(pattern=olayers, replacement=save, x=layers))
  }
  
  for (i in seq_along(layers)) {
    l = layers[i]
    
    # Get counts
    counts = SeuratObject::LayerData(sc[[assay]], layer=l, fast=NA)
    
    # If requested apply log transformation, else it is just identity
    if (log) counts = log1p(counts)
    
    LayerData(sc[[assay]], 
              layer=save[i], 
              features=SeuratObject::Features(sc[[assay]], layer=l),
              cells=SeuratObject::Cells(sc[[assay]], layer=l)) = counts
    
  }
  
  # Log command
  sc = Seurat::LogSeuratCommand(sc)
  
  return(sc)
}

# Wrapper around SpaNorm
# Written for 1 assay, we need to loop through all layers if we have multiple images
SpaNormWrapper = function(sc) { 
  require(SpaNorm)
  require(SpatialExperiment)

  # +++ Convert Seurat to SpatialExperiment +++
  # a) Counts
  counts = SeuratObject::GetAssayData(sc, layer="counts")
  
  # b) Barcode metadata
  barcode_metadata = data.frame(row.names=SeuratObject::Cells(counts))
  barcode_metadata$cell_count = 1
  barcode_metadata$sample_id = "sample"
  
  # c) Spatial coords (full resolution)
  coords = SeuratObject::GetTissueCoordinates(sc)
  rownames(coords) = coords$cell
  coords$cell = NULL
  coords = as.matrix(coords)
  
  # Create SpatialExperiment object
  spe = SpatialExperiment(
    assay = list(counts=counts), 
    colData = barcode_metadata, 
    spatialCoords = coords)

  # +++ Run SpaNorm +++
  set.seed(1)
  spe = SpaNorm(spe)

  # +++ Put normalised data back to Seurat +++
  # Note: it is classical matrix and therefore might be huge
  normalised_data = SingleCellExperiment::logcounts(spe)
  normalised_data = as(normalised_data, "sparseMatrix") 
  sc = SeuratObject::SetAssayData(sc, layer="data", new.data=normalised_data, assay="Xenium")

  return(sc)
}
