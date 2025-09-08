# [최종 수정] Docker Hub에서 현재 사용 가능함이 확인된 공식 이미지 태그
FROM pytorch/pytorch:2.2.2-cpu-py311

# --- 아래 내용은 동일합니다 ---
# 컨테이너 내부에 앱을 위한 작업 공간(/app)을 만듭니다.
WORKDIR /app

# 의존성 파일을 먼저 복사합니다.
COPY requirements.txt .

# requirements.txt에 명시된 라이브러리들을 설치합니다.
RUN pip install --no-cache-dir -r requirements.txt

# 현재 폴더의 모든 파일을 컨테이너의 /app 폴더로 복사합니다.
COPY . .

# FastAPI 앱을 실행하는 명령어를 설정합니다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]