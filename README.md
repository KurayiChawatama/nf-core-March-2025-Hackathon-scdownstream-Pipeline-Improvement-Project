# 🔬 nf-core March 2025 Hackathon Project: Enhancing the nf-core/scdownstream Pipeline

Welcome to our nf-core hackathon March 2025 project! This repository contains collaborative work to **improve the [nf-core/scdownstream](https://github.com/nf-core/scdownstream) pipeline** by expanding tool diversity, improving support for model organisms, and enhancing user accessibility.

---

## 🎯 Project Goals

1. **🔍 Doublet Detection**
   - **Add support for scDblFinder**, a highly regarded R-based tool for doublet detection in single-cell RNA-seq data.
   - Benchmarks show scDblFinder outperforms several tools currently included in the pipeline.

2. **🧬 Species Support Expansion**
   - Expand support for **non-human species**, particularly **mouse**, using resources like **Tabula Muris Senis**.
   - Ideal for contributors familiar with scRNA-seq data analysis from model organisms.

3. **📖 Documentation and Accessibility**
   - Improve usage docs and onboarding materials.
   - Make the pipeline more accessible for first-time contributors.

---

## ⚙️ Recommended Development Workflow

This project involves:
- Adding/testing new tools (like **scDblFinder**).
- Editing and validating **nf-core modules**.
- Working with **R and Python-based tools**.
- Fast iteration and troubleshooting.

### 🚧 Development Setup

We recommend the following workflow:

1. **Use Conda for local development**
   - Create an isolated environment for modifying/testing dependencies.
   - Activate the environment before working.

2. **Use Docker or Singularity for reproducible final validation**
   - Once the pipeline is stable, switch to containers for robust testing.

---

## 🧪 Suggested Conda Environment

Create your dev environment using the following `scdev.yml`:

```yaml
name: scdev
channels:
  - conda-forge
  - bioconda
  - defaults
dependencies:
  - python=3.12
  - nextflow
  - nf-core
  - mamba
  - r-base
  - r-devtools
  - r-optparse
  - bioconductor-scdblfinder
  - bioconductor-singlecellexperiment
  - bioconductor-scran
  - r-seurat
  - r-dplyr
  - r-ggplot2
  - r-data.table
```

Install via:

```bash
mamba env create -f scdev.yml
conda activate scdev
```
## 💻 Launching R Studio from Conda Environment

Run RStudio using the R inside your Conda env:

```bash
RSTUDIO_WHICH_R=/home/issamonopoly/miniconda3/envs/scdev/bin/R rstudio
```

## 🧵 Keeping RStudio Running with tmux (Optional but Recommended)

1. Install tmux:
```bash
sudo apt install tmux
```
2. Create a new session:

```bash
tmux new -s rstudio_session
```
3. Inside tmux:

```bash
conda activate scdev
RSTUDIO_WHICH_R=/home/issamonopoly/miniconda3/envs/scdev/bin/R rstudio
```

4. Detach from the session (RStudio stays running):

```
Ctrl + B, then press D
```

5. Reattach later:

```bash
tmux attach -t rstudio_session
```

To list or kill sessions:

```bash
tmux ls
tmux kill-session -t rstudio_session
```

## 👥 Project Contributors

**Group Leaders**

- [KurayiChawatama](https://github.com/KurayiChawatama) – Kurayi Chawatama  
- [bogrum](https://github.com/bogrum) – Emre Taha Çevik
- 
**see the [hackathon website](https://nf-co.re/events/2025/hackathon-march-2025#projects) for our slack contact information**
  
Contributors of all experience levels are welcome! Whether you're comfortable with R/Python scRNA-seq analysis or just starting out—there’s a place for you.

---

## 🚀 Let’s Hack!

This project is part of an **nf-core hackathon** focused on improving downstream single-cell RNA-seq analysis. We’re excited to build something impactful together. ✨

> 📢 Questions? Ideas? PRs? Issues? Dive in!
