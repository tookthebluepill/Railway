# 1. PyTorch가 미리 설치된 공식 이미지를 기반으로 시작합니다.
# 이렇게 하면 빌드 시점에 PyTorch를 다운로드하고 설치하는 과정을 생략할 수 있습니다.
FROM pytorch/pytorch:2.1.0-cpu-py3.10-ubuntu22.04

# 2. 컨테이너 내부에 앱을 위한 작업 공간(/app)을 만듭니다.
WORKDIR /app

# 3. 의존성 파일을 먼저 복사합니다.
COPY requirements.txt .

# 4. requirements.txt에 명시된 라이브러리들을 설치합니다.
# (PyTorch는 이미 이미지에 포함되어 있으므로 나머지 라이브러리만 빠르게 설치됩니다.)
RUN pip install --no-cache-dir -r requirements.txt

# 5. 현재 폴더의 모든 파일을 컨테이너의 /app 폴더로 복사합니다.
COPY . .

# 6. FastAPI 앱을 실행하는 명령어를 설정합니다.
# Railway가 자동으로 PORT 환경변수를 설정해주므로 그대로 사용하면 됩니다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]