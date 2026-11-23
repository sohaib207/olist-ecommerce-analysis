# Upload the complete project package (Windows)

The repository already contains the project README. To upload the remaining local project files, follow these steps:

1. Download `Olist_Ecommerce_Analysis_GitHub_Ready.zip` from this conversation and extract it.
2. Install Git for Windows if it is not already installed: https://git-scm.com/download/win
3. Open the extracted project folder and run `PUBLISH_TO_GITHUB.bat`.
4. Paste `https://github.com/sohaib207/olist-ecommerce-analysis.git` when prompted.
5. Sign in to GitHub when Git requests authentication. When the script reports success, refresh the repository and check the files.

The script fetches the existing `main` branch first, so it preserves the README already published here before adding the full local package. The SQLite database is about 65 MB, below GitHub's 100 MB per-file hard limit, though GitHub may warn about files over 50 MB.
