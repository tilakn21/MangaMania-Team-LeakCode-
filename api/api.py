from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
import requests

app = FastAPI()

@app.post("/upload/")
async def upload_file(file: UploadFile = File(...)):
    try:
        contents = await file.read()
        # Process the uploaded file here (e.g., save to disk, process data)
        with open(f"uploaded_{file.filename}", "wb") as f:
            f.write(contents)
        return JSONResponse(content={"message": "File uploaded successfully"})
    except Exception as e:
        return JSONResponse(content={"error": str(e)}, status_code=500)
    

import requests

def upload_file_to_server():
    url = "http://localhost:8000/upload/"
    files = {"file": open("C:/Users/Tilak/Desktop/New folder/LeakCode/api/nsfw.py", "rb")}
    
    try:
        response = requests.post(url, files=files)
        if response.status_code == 200:
            print("File uploaded successfully")
        else:
            print(f"Upload failed with status code: {response.status_code}")
    except Exception as e:
        print(f"Error uploading file: {e}")


upload_file_to_server()