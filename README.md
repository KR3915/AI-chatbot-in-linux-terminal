# Chatbot CLI
![Python](https://img.shields.io/badge/Python-3.7%2B-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-lightgrey.svg)
![Build](https://img.shields.io/badge/Build-PyInstaller-orange.svg)
This project provides a command-line chatbot interface that uses the [GROQ API](https://groq.com/) to generate text-based responses from a language model. It is packaged into a standalone binary using `pyinstaller` for ease of use.

---
##Example
```bash
desktop:~$ chatbot
enter message (type 'q' to quit): what is api?
----------------------------------------------------------------------
API (Application Programming Interface): A set of defined rules that enables different software systems to
communicate with each other, allowing them to exchange data and services. It acts as a messenger between systems,
enabling integration and functionality sharing.
```

## Overview

The chatbot communicates with the GROQ API to send user input and receive language model responses. It uses the `groq` Python client to interact with the API. The project includes a setup script that:

- Builds the Python chatbot into a single binary using PyInstaller
- Adds a shell alias so you can run `chatbot` from anywhere
- Stores your `GROQ_API_KEY` securely in your shell configuration

---

## How It Works

1. The chatbot script loads your `GROQ_API_KEY` from an environment variable.
2. It initializes the `groq` client and sends a chat completion request to a GROQ-hosted model (e.g., `mixtral-8x7b-32768`).
3. It processes user input in a loop and prints model responses in the terminal.

You must have a valid GROQ account and API key to use the chatbot.

---

## Installation (Linux/macOS)

Clone the repository and run the setup script:

```bash
# 1. Clone the repository
git clone (https://github.com/KR3915/AI-chatbot-in-linux-terminal.git)
cd AI-chatbot-in-linux-terminal
```
```bash
# 2. Run the setup script
chmod +x setup_chatbot.sh
./setup_chatbot.sh
```
```bash
# 3. Start the chatbot
chatbot
```
