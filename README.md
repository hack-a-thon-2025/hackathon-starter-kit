# 🧠 HACKATHON_SETUP.md

Welcome to the **Hackathon Developer Environment Setup Guide** for Windows (Git Bash).  
This ensures your system is ready with all required tools before the event starts — so you can code, not configure.

💡 Be sure to run the `hackathon_setup.sh` as an adminstrator.

---

## 🚀 Overview

Your system will be set up with the following:

| Tool | Purpose |
|------|----------|
| **Git + Git Bash** | Version control and developer shell |
| **Node.js (LTS)** | JavaScript runtime |
| **Python (3.12+)** | Backend scripting and AI tooling |
| **AWS CLI v2** | AWS integration and automation |
| **Gemini CLI** | Access Google Gemini AI via API |
| **VS Code** | Lightweight IDE for quick iteration |
| **PyCharm (Community)** | Python IDE for more advanced projects |
| **Docker Desktop** | Containerized app environment |

---

## 🔑 Step 1: Configure Gemini API Access

Each developer needs a **Gemini API Key** to use Google’s AI tools during the hackathon.

1. Go to [https://aistudio.google.com/app/apikey](https://aistudio.google.com/app/apikey)
2. Create a new API key and copy it.

3. Update the [hackathon_setup.sh](hackathon_setup.sh) in the following section with your API KEY

```bash
mkdir -p ~/.gemini
cat > ~/.gemini/.env <<EOF
GEMINI_API_KEY="<YOUR_GEMINI_API_KEY>"
# Optional settings:
# GOOGLE_CLOUD_PROJECT="your-gcp-project-id"
# GEMINI_MODEL="gemini-2.5-flash"
EOF
```


## ⚙️ Step 2: Download the Install Script

Save the script below as **hackathon_setup.sh** on your Desktop.

Then open **Git Bash as Administrator** and run:

```bash
bash ~/Desktop/hackathon_setup.sh
```

---

## ☁️ Step 4: AWS CLI Configuration (Optional)

If your team uses AWS:

```bash
aws configure
```

Enter your **Access Key**, **Secret Key**, and default region (e.g., `us-east-1`).

---

## 🧠 Step 5: Recommended MCP Tools

## 💡 Recommended MCP Tools

To make your hackathon experience smoother, consider using these MCP tools:



---

You should see valid version numbers and your Gemini key printed.

---

## 🧩 Step 7: Optional IDE Setup

**VS Code Recommended Extensions:**
```bash
code --install-extension ms-python.python
code --install-extension dbaeumer.vscode-eslint
code --install-extension GitLab.gitlab-workflow
code --install-extension GoogleAI.gemini-assistant
```

**PyCharm**:  
Once installed, open PyCharm and configure the Python interpreter via:
```
File → Settings → Project: <project_name> → Python Interpreter
```

---

## 🧭 Step 8: Get Your GitLab Repo Ready

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git clone <your-team-repo-url>
cd <repo-folder>
```

Then push your first commit:

```bash
git add .
git commit -m "Initial hackathon setup"
git push origin main
```

---

## 🎯 You’re Ready to Hack!

✅ All essential tools installed  
✅ API access configured  
✅ IDEs ready  
✅ Docker Desktop running  
✅ GitLab linked  

Now you can **build, test, and deploy** right away.
