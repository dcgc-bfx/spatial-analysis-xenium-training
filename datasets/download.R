# Dataset provided by 10x: Xenium Mouse Brain Hemisphere (Fresh Frozen) with 5K Mouse Pan Tissue and Pathways Panel
# https://www.10xgenomics.com/datasets/xenium-prime-fresh-frozen-mouse-brain

# Prepare directory 
unlink("datasets/xenium_mouse_brain", recursive=TRUE)
dir.create("datasets/xenium_mouse_brain")

# Download Xenium dataset 
curl::curl_download(url="https://cf.10xgenomics.com/samples/xenium/3.0.0/Xenium_Prime_Mouse_Brain_Coronal_FF/Xenium_Prime_Mouse_Brain_Coronal_FF_outs.zip",
                    destfile="datasets/Xenium_Prime_Mouse_Brain_Coronal_FF_outs.zip")
unzip(zipfile="datasets/Xenium_Prime_Mouse_Brain_Coronal_FF_outs.zip", exdir="datasets/xenium_mouse_brain")
unlink("datasets/Xenium_Prime_Mouse_Brain_Coronal_FF_outs.zip")
untar("datasets/xenium_mouse_brain/cell_feature_matrix.tar.gz", exdir="output_dir")


# Download H&E images
curl::curl_download(url="https://cf.10xgenomics.com/samples/xenium/3.0.0/Xenium_Prime_Mouse_Brain_Coronal_FF/Xenium_Prime_Mouse_Brain_Coronal_FF_he_image.ome.tif", 
                    destfile="datasets/xenium_mouse_brain/Xenium_Prime_Mouse_Brain_Coronal_FF_he_image.ome.tif")
curl::curl_download(url="https://cf.10xgenomics.com/samples/xenium/3.0.0/Xenium_Prime_Mouse_Brain_Coronal_FF/Xenium_Prime_Mouse_Brain_Coronal_FF_he_imagealignment.csv", 
                    destfile="datasets/xenium_mouse_brain/Xenium_Prime_Mouse_Brain_Coronal_FF_he_imagealignment.csv")


# Allen Brain Atlas from Seurat Visium HD vignette. Seurat object. Reduced to 200,000 cells (and rare cell types <25 cells have been removed).
curl::curl_download(url="https://www.dropbox.com/scl/fi/r1mixf4eof2cot891n215/allen_scRNAseq_ref.Rds?rlkey=ynr6s6wu1efqsjsu3h40vitt7&dl=1",
                     destfile="datasets/allen_scRNAseq_ref.Rds")

# Pre-computed SPaNorm data
h = curl::new_handle()
curl::handle_setopt(handle=h, userpwd="jfHcF6RxsWJTa5Y:1234")
curl::handle_setheaders(h, "X-Requested-With"="XMLHttpRequest")
curl::curl_download(url="https://datashare.tu-dresden.de/public.php/webdav/",
                    destfile="datasets/spanorm.rds",
                    handle=h)