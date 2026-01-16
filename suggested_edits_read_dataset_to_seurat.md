# Suggested Edits for read_dataset_to_seurat.qmd

This document lists all the typos, inconsistencies, and formatting issues found in `workbooks/read_dataset_to_seurat.qmd`, along with suggested corrections.

---

## 1. Spelling Consistency (British vs American English)

**Line 16:**
- **Current:** `visualisations` and `familiarise`
- **Suggested:** `visualizations` and `familiarize`
- **Reason:** The rest of the document uses American English spelling (visualization, visualizing, visualize)

**Change:**
```diff
- In this **first part**, we will explore the dataset, learn how to load it into R, and examine how the data is structured within a Seurat object. We will also perform some initial visualisations to familiarise ourselves with the dataset and its spatial features.
+ In this **first part**, we will explore the dataset, learn how to load it into R, and examine how the data is structured within a Seurat object. We will also perform some initial visualizations to familiarize ourselves with the dataset and its spatial features.
```

---

## 2. Hex Color Code Capitalization

**Line 34:**
- **Current:** `"#Fa1a8e"`
- **Suggested:** `"#fa1a8e"`
- **Reason:** All other hex color codes in the palette use lowercase letters

**Change:**
```diff
 # Colours
-cal_pal50 = c("#Fa1a8e", "#009B7D", "#ff9933", "#7083a4", "#ffce45", "#015e05",
+cal_pal50 = c("#fa1a8e", "#009B7D", "#ff9933", "#7083a4", "#ffce45", "#015e05",
```

---

## 3. Missing Colon in Bulleted List

**Line 80:**
- **Current:** `* binned_outputs Folder containing...`
- **Suggested:** `* binned_outputs: Folder containing...`
- **Reason:** All other items in the list have colons after the filename/folder name

**Change:**
```diff
-* `binned_outputs` Folder containing results organized by different bin sizes
+* `binned_outputs`: Folder containing results organized by different bin sizes
```

---

## 4. Inconsistent Folder Naming

**Line 83:**
- **Current:** `square_0016um/`
- **Suggested:** `square_016um/`
- **Reason:** The actual folder used in code blocks (lines 118, 122, 126) is `square_016um` (three digits, not four)

**Change:**
```diff
    * `square_002um/`: Binned data with 2 µm resolution
    * `square_008um/`: Binned data with 8 µm resolution
-   * `square_0016um/`: Binned data with 16 µm resolution
+   * `square_016um/`: Binned data with 16 µm resolution
```

---

## 5. Missing Colons in Bulleted List

**Lines 106-107:**
- **Current:** `features.tsv.gz` and `matrix.mtx.gz` without colons
- **Suggested:** Add colons after both items
- **Reason:** The first item (`barcodes.tsv.gz`) has a colon, so for consistency all items should have colons

**Change:**
```diff
 * `barcodes.tsv.gz`: Contains the names (or identifiers) for each of the bins in the dataset
-* `features.tsv.gz` Contains essential information about the genes, including their Ensembl IDs, symbols and gene types
-* `matrix.mtx.gz` Contains the actual counts data
+* `features.tsv.gz`: Contains essential information about the genes, including their Ensembl IDs, symbols and gene types
+* `matrix.mtx.gz`: Contains the actual counts data
```

---

## 6. Inconsistent Dataset Reference

**Line 112:**
- **Current:** `016 µm dataset`
- **Suggested:** `16 µm dataset`
- **Reason:** Throughout the document, bin sizes are referred to as "2 µm", "8 µm", and "16 µm" (without leading zeros in the text descriptions)

**Change:**
```diff
-Here are the first few lines of each file for the 016 µm dataset:
+Here are the first few lines of each file for the 16 µm dataset:
```

---

## 7. Incorrect Package Reference and Link

**Line 145:**
- **Current:** `[scanpy](https://squidpy.readthedocs.io/en/stable/) package in Python.`
- **Suggested:** Correct the link and add proper reference to Squidpy
- **Reason:** The link points to Squidpy documentation but the text says "scanpy". Scanpy is for single-cell analysis; Squidpy is its spatial extension

**Change:**
```diff
-Another popular option is the [scanpy](https://squidpy.readthedocs.io/en/stable/) package in Python.
+Another popular option is the [Scanpy](https://scanpy.readthedocs.io/) package in Python, with its spatial extension [Squidpy](https://squidpy.readthedocs.io/en/stable/).
```

---

## Summary

**Total issues found:** 7

**Categories:**
- Formatting consistency: 3 issues (missing colons)
- Naming inconsistencies: 3 issues (folder names, dataset references, hex codes)
- Package references: 1 issue (incorrect link)
- Spelling standardization: 1 issue (British vs American English)

All suggested changes maintain consistency with the rest of the document and correct factual inaccuracies.
