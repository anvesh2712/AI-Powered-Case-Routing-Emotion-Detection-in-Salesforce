# 🤖 AI-Based Case Routing & Sentiment Prioritization in Salesforce

This project integrates Salesforce with HuggingFace NLP models to intelligently classify and route Cases based on department and customer emotion. It leverages **zero-shot learning** and **emotion detection** to enable smarter case handling with no managed packages or licenses.

## 📌 Features
- 🔎 Zero-Shot Classification to predict the responsible department
- 😠 Emotion Detection to prioritize based on tone
- ⚙️ Asynchronous callouts using @future(callout=true)
- 🛡️ HuggingFace integration via Salesforce Named Credentials

## 🧠 Models Used
- **facebook/bart-large-mnli** – department classification
- **bhadresh-savani/distilbert-base-uncased-emotion** – emotion detection

## 🧱 Project Structure
See the folders included for Apex classes, Postman testing, and setup documentation.

## 🧪 Postman Sample
Test payloads for both classification and sentiment detection included.

## 📜 License
MIT License