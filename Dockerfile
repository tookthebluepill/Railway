# [최종 수정] 복잡한 부분을 모두 제거한, 공식적으로 확인된 가장 단순한 CPU 태그
FROM pytorch/pytorch:2.3.1-cpu

# --- 아래 내용은 동일합니다 ---
WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]