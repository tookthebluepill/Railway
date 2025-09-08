# 대용량 라이브러리(pytorch, scikit-learn 등)가 미리 설치된 이미지를 사용
FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

# 작업 디렉토리 설정
WORKDIR /app

# 프로젝트 파일 복사
COPY . .

# 포트 노출
EXPOSE 8000

# 앱 실행 명령어
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]