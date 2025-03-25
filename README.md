# 🔬 nf-core March 2025 Hackathon Project: Enhancing the nf-core/scdownstream Pipeline

Welcome to our nf-core hackathon March 2025 project! This repository contains collaborative work to **improve the [nf-core/scdownstream](https://github.com/nf-core/scdownstream) pipeline** by expanding tool diversity, improving support for model organisms, and enhancing user accessibility.

## Important Note

**This repo is for project coordination only!**

🔧 **Code contributions happen here: [scdownstream fork](https://github.com/KurayiChawatama/scdownstream)**

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

2. **Use Docker for reproducible final validation**
   - Once the pipeline is stable, switch to containers for robust testing.

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
  - r-tidyverse
  - bioconductor-scdblfinder
  - bioconductor-singlecellexperiment
  - bioconductor-scran
  - r-seurat
  - jupyterlab
  - git
```

Install via:

```bash
mamba env create -f scdev.yml
conda activate scdev
```

## 💻 Launching R Studio from Conda Environment

Run RStudio using the R inside your Conda env:

```bash
RSTUDIO_WHICH_R=/home/your_username/miniconda3/envs/scdev/bin/R rstudio
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
RSTUDIO_WHICH_R=/home/your_username/miniconda3/envs/scdev/bin/R rstudio
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

---

## 👥 Project Contributors

### Group Leaders

- [KurayiChawatama](https://github.com/KurayiChawatama) – Kurayi Chawatama  
- [bogrum](https://github.com/bogrum) – Emre Taha Çevik

**see the [hackathon website](https://nf-co.re/events/2025/hackathon-march-2025#projects) for our slack contact information**
  
Contributors of all experience levels are welcome! Whether you're comfortable with R/Python scRNA-seq analysis or just starting out—there’s a place for you.

## 🧩 Where to Start Today (Suggested First Steps)

1. **Set up the Conda dev environment** (you already have the YAML).
2. **Clone the repo and explore the pipeline structure**:

   ```bash
   git clone https://github.com/nf-core/scdownstream.git
   cd scdownstream
   ```

3. **Pick a task based on your interest** (tool integration, species support, docs).
4. **Check the open issues / discussions tab on the repo**, or create your own task if it’s not listed.

## 🧠 List Of Tasks: Pick a Track

Here’s a breakdown of **what you can do to contribute**, based on your interests and experience level:

### 1. 🧪 **Tool Integration (e.g. scDblFinder)**

**Great if you like R, pipeline logic, and Nextflow.**

- [ ] Familiarize yourself with how `nf-core/scdownstream` currently handles doublet detection.
- [ ] Fork the repo and clone it locally.
- [ ] Add `scDblFinder` as a new doublet detection option:
  - Add it as a **new module** (check [`nf-core/modules`](https://github.com/nf-core/modules)).
  - Hook it into the pipeline config and `main.nf` logic.
- [ ] Test the module locally with mock/test data.
- [ ] Add an option in `params.schema.json` so users can select scDblFinder.

📚 Reference:

- [`nf-core/modules`](https://github.com/nf-core/modules)
- [`nf-core/tools` guide](https://nf-co.re/developers/adding_tools)

---

### 2. 🐭 **Mouse Species Support**

**Great if you're familiar with scRNA-seq or bioinformatics data formats.**

- [ ] Check if `nf-core/scdownstream` currently hardcodes human genome references or assumptions.
- [ ] Create/test a pipeline run using mouse data, e.g., from **Tabula Muris Senis**.
- [ ] Note any species-specific adjustments (annotation formats, gene IDs, marker gene lists).
- [ ] Suggest or implement generalizable species selection logic (e.g., via params).

---

### 3. 📖 **Improve Docs & Onboarding**

**Perfect if you want to help others and like writing clear instructions.**

- [ ] Walk through the current documentation from a new user's perspective.
- [ ] Identify anything that’s missing, confusing, or out of date.
- [ ] Add:
  - A contributor quickstart guide.
  - An example config for mouse data.
  - Code comments in newly added modules.

---

### 4. 🧪 **Testing + Validation**

**Ideal if you’re detail-oriented or new to contributing.**

- [ ] Pull the current pipeline branch and test it with provided input data.
- [ ] Try running `scDblFinder` manually in R on example datasets, compare it with the pipeline output.
- [ ] Help improve or expand unit tests and CI workflows.

## 🧰 Tools You’ll Be Using

- **Nextflow** for pipeline structure.
- **R** (especially for scDblFinder and Seurat/SCE workflows).
- **GitHub** for collaboration.
- **Docker** for reproducibility.
- **Markdown** for documentation.

# 🚀 Day 1 Report

## ✅ What we got done

1. 🧐 Figured out how the doublet detection pipeline works
2. Adapted the random based method of scDblFinder to the workflow

## To Dos

### High Priority/Easy Small Tasks

1. Adapt the [scDblFinder clustering based method](https://github.com/KurayiChawatama/scdownstream/blob/dev/modules/local/doublet_detection/scDblFinder/templates/scDblFinder_clusters.R) into a module. See [this example](https://github.com/KurayiChawatama/scdownstream/blob/dev/modules/local/doublet_detection/scDblFinder/templates/scDblFinder_random.R)
2. Adapt the random method's process into the broader pipeline creating all the necessary auxiliary files as per the [contribution guidelines](https://nf-co.re/docs/tutorials/contributing_to_nf-core/contributing_to_pipelines)
3. Create the docker image with all the dependencies([see the scDblFinder environment.yml](https://github.com/KurayiChawatama/scdownstream/blob/dev/modules/local/doublet_detection/scDblFinder/environment.yml)) needed for the scDblFinder package to work using [this site](https://seqera.io/containers/). **Make sure it contains a specific version of R and python(3.12) for reproducibility**
4. Remove `#still bioconda` comment from environment yml
5. Newer team members should:
   - finish the [intro to nextflow](https://training.nextflow.io/latest/), preferably up to **hello-modules ASAP**
   - set up their local environments as detailed [here](https://training.nextflow.io/latest/envsetup/), [here](https://nf-co.re/docs/nf-core-tools/installation) and here in this repo's [repo scdev.yml](https://github.com/KurayiChawatama/nf-core-March-2025-Hackathon-scdownstream-Pipeline-Improvement-Project/blob/main/scdev.yml) for the local conda env
   - fork the necessary repos [1](https://github.com/KurayiChawatama/nf-core-March-2025-Hackathon-scdownstream-Pipeline-Improvement-Project) and [2](https://github.com/KurayiChawatama/scdownstream)
   - **IMPORTANT NOTE** make sure to install the nf-core, nextflow, python, yml, R and github copilot extensions etc. for vscode

---

### Lower Priority Tasks

1. Download and process (if necessary) small annotated scRNAseq datasets to use as test data
2. Add the other contributors to this readme and check it for syntax errors
3. Move on to the Mouse annotation support!
4. Move on to Adapt the pipeline 's doublet removal modules to work with the detected doublets
