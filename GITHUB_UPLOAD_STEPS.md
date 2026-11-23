# Upload the complete project package (Windows)

The repository already contains the project README. To upload the remaining local project files, follow these steps:

1. Download `Olist_Ecommerce_Analysis_GitHub_Ready.zip` from this conversation and extract it.
2. Install Git for Windows if it is not already installed: https://git-scm.com/download/win
3. Open the extracted project folder and run `PUBLISH_TO_GITHUB.bat`.
4. Paste `https://github.com/sohaib207/olist-ecommerce-analysis.git` when prompted.
5. Sign in to GitHub when Git requests authentication. When the script reports success, refresh the repository and check the files.

The script fetches the existing `main` branch first, so it preserves the README already published here before adding the remaining project files. The local `olist.db` file is intentionally excluded by `.gitignore`; the README links to its separate Google Drive download. The script reuses your configured Git identity, or asks for one if none is configured. A GitHub noreply email can be used if you do not want your personal email in commit metadata.
