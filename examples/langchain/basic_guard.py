"""Basic jpi-guard integration with LangChain."""
import os
from jpi_guard import JpiGuard
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage

guard = JpiGuard(api_key=os.getenv("JPI_GUARD_API_KEY"))
llm = ChatOpenAI(model="gpt-4o")

def safe_chat(user_input: str) -> str:
    result = guard.scan(user_input)
    if result.is_injection:
        return "セキュリティ上の理由によりこの入力は処理できません"
    response = llm.invoke([HumanMessage(content=user_input)])
    return response.content

if __name__ == "__main__":
    print(safe_chat("こんにちは！今日の天気を教えてください"))
