from PIL import Image
import streamlit as st
from pdf2image import convert_from_bytes
import io
import os
from transformers import AutoModelForImageClassification, ViTImageProcessor
import torch

# Load your ML model and processor
model = AutoModelForImageClassification.from_pretrained("Falconsai/nsfw_image_detection")
processor = ViTImageProcessor.from_pretrained('Falconsai/nsfw_image_detection')

def preprocess_image(image):
    # Preprocess image as needed (e.g., resize, convert to RGB, etc.)
    low_res_img = image.convert(mode='RGB')
    return low_res_img

def predict_nsfw(image):
    with torch.no_grad():
        inputs = processor(images=image, return_tensors="pt")
        outputs = model(**inputs)
        logits = outputs.logits

    predicted_label = logits.argmax(-1).item()
    label = model.config.id2label[predicted_label]
    
    return label

def main():
    st.title("PDF Input and NSFW Detection App")
    
    # File uploader for PDF files
    uploaded_file = st.file_uploader("Upload a PDF file", type=["pdf"])
    
    if uploaded_file is not None:
        # Convert PDF to images
        images = convert_from_bytes(uploaded_file.read())
        
        # Process and classify each image
        nsfw_found = False
        for img in images:
            processed_img = preprocess_image(img)
            
            # Call your ML model for classification
            label = predict_nsfw(processed_img)
            
            if label == 'nsfw':
                nsfw_found = True
                break
        
        if nsfw_found:
            st.write("NSFW content detected!")
        else:
            st.write("No NSFW content detected.")
    else:
        st.write("Waiting for PDF file upload...")

if __name__ == "__main__":
    main()
