# 🧠 GEMINI.md - Project Context

This document provides an overview of the `hackathon-setup` project for the Gemini CLI, outlining its purpose, contents, and usage instructions.

## 🚀 Project Overview

This project is designed to automate the setup of a comprehensive developer environment for hackathon participants on Windows. It uses a Git Bash script (`hackathon_setup.sh`) to install and configure a standard set of essential tools, ensuring a consistent and ready-to-code environment for all attendees.

The core technologies and tools involved are:
*   **Shell Scripting:** The automation is handled by a `bash` script.
*   **Package Management:** It leverages `Chocolatey` for installing Windows software and `npm` for Node.js packages.
*   **Core Development Tools:** Git, Node.js (LTS), Python 3, AWS CLI v2, and the Gemini CLI.
*   **IDEs:** Visual Studio Code and PyCharm (Community Edition).
*   **Containerization:** Docker Desktop.

## ⚙️ Building and Running

The primary entry point for this project is the `hackathon_setup.sh` script.

**Instructions:**

1.  **Configure API Key:** Before running the script, you must edit `hackathon_setup.sh` and insert your personal Gemini API key into the designated placeholder.
2.  **Execute the Script:** Run the script from a **Git Bash** terminal with **Administrator privileges**.

    ```bash
    ./hackathon_setup.sh
    ```

The script will then proceed to install all the necessary tools. The `HACKATHON_SETUP.md` file contains more detailed, step-by-step instructions for participants.

## 📂 Key Files

*   **`hackathon_setup.sh`**: The main executable script that performs the environment setup. It installs all the tools and creates the necessary configuration files.
*   **`HACKATHON_SETUP.md`**: A detailed instructional guide for hackathon participants, explaining how to prepare their system, configure API keys, and run the setup script.
*   **`README.md`**: A minimal readme file for the project.
