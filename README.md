1| # 🔬 nf-core March 2025 Hackathon Project: Enhancing the nf-core/scdownstream Pipeline
2| 
3| Welcome to our nf-core hackathon March 2025 project! This repository contains collaborative work to **improve the [nf-core/scdownstream](https://github.com/nf-core/scdownstream) pipeline** by expanding the diversity of selectable tools.
4| 
5| ---
6| 
7| ## 🎯 Project Goals
8| 
9| 1. **🔍 Doublet Detection**
10|    - **Add support for scDblFinder**, a highly regarded R-based tool for doublet detection in single-cell RNA-seq data.
11|    - Benchmarks show scDblFinder outperforms several tools currently included in the pipeline.
12| 
13| 2. **🧬 Species Support Expansion**
14|    - Expand support for **non-human species**, particularly **mouse**, using resources like **Tabula Muris Senis**.
15|    - Ideal for contributors familiar with scRNA-seq data analysis from model organisms.
16| 
17| 3. **📖 Documentation and Accessibility**
18|    - Improve usage docs and onboarding materials.
19|    - Make the pipeline more accessible for first-time contributors.
20| 
21| ---
22| 
23| ## ⚙️ Recommended Development Workflow
24| 
25| This project involves:
26| - Adding/testing new tools (like **scDblFinder**).
27| - Editing and validating **nf-core modules**.
28| - Working with **R and Python-based tools**.
29| - Fast iteration and troubleshooting.
30| 
31| ### 🚧 Development Setup
32| 
33| We recommend the following workflow:
34| 
35| 1. **Use Conda for local development**
36|    - Create an isolated environment for modifying/testing dependencies.
37|    - Activate the environment before working.
38| 
39| 2. **Use Docker for reproducible final validation**
40|    - Once the pipeline is stable, switch to containers for robust testing.
41| 
42| ---
43| 
44| ## 🧪 Suggested Conda Environment
45| 
46| Create your dev environment using the following `scdev.yml`:
47| 
48| ```yaml
49| name: scdev
50| channels:
51|   - conda-forge
52|   - bioconda
53|   - defaults
54| dependencies:
55|   - python=3.12
56|   - nextflow
57|   - nf-core
58|   - mamba
59|   - r-base
60|   - r-devtools
61|   - r-optparse
62|   - bioconductor-scdblfinder
63|   - bioconductor-singlecellexperiment
64|   - bioconductor-scran
65|   - r-seurat
66|   - r-dplyr
67|   - r-ggplot2
68|   - r-data.table
69| ```
70| 
71| Install via:
72| 
73| ```bash
74| mamba env create -f scdev.yml
75| conda activate scdev
76| ```
77| ## 💻 Launching R Studio from Conda Environment
78| 
79| Run RStudio using the R inside your Conda env:
80| 
81| ```bash
82| RSTUDIO_WHICH_R=/home/your_username/miniconda3/envs/scdev/bin/R rstudio
83| ```
84| 
85| ## 🧵 Keeping RStudio Running with tmux (Optional but Recommended)
86| 
87| 1. Install tmux:
88| ```bash
89| sudo apt install tmux
90| ```
91| 2. Create a new session:
92| 
93| ```bash
94| tmux new -s rstudio_session
95| ```
96| 3. Inside tmux:
97| 
98| ```bash
99| conda activate scdev
100| RSTUDIO_WHICH_R=/home/your_username/miniconda3/envs/scdev/bin/R rstudio
101| ```
102| 
103| 4. Detach from the session (RStudio stays running):
104| 
105| ```
106| Ctrl + B, then press D
107| ```
108| 
109| 5. Reattach later:
110| 
111| ```bash
112| tmux attach -t rstudio_session
113| ```
114| 
115| To list or kill sessions:
116| 
117| ```bash
118| tmux ls
119| tmux kill-session -t rstudio_session
120| ```
121| 
122| ## 👥 Project Contributors
123| 
124| **Group Leaders**
125| 
126| - [KurayiChawatama](https://github.com/KurayiChawatama) – Kurayi Chawatama  
127| - [bogrum](https://github.com/bogrum) – Emre Taha Çevik
128| - 
129| **see the [hackathon website](https://nf-co.re/events/2025/hackathon-march-2025#projects) for our slack contact information**
130|   
131| Contributors of all experience levels are welcome! Whether you're comfortable with R/Python scRNA-seq analysis or just starting out—there’s a place for you.
132| 
133| ---
134| 
135| ## 🚀 Let’s Hack!
136| 
137| This project is part of an **nf-core hackathon** focused on improving downstream single-cell RNA-seq analysis. We’re excited to build something impactful together. ✨
138| 
139| > 📢 Questions? Ideas? PRs? Issues? Dive in!
140| 
