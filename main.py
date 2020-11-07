import streamlit as st
import pandas as pd


"""
# 初めての Streamlit
データフレームを表として出力できます:
"""

df = pd.DataFrame({"first column": [1, 2, 3, 4], "second column": [10, 20, 30, 40]})

df
