import pandas as pd
import json
import joblib
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import f1_score

df = pd.read_csv("data/winequality-red.csv")

X = df.drop("quality", axis=1)
y = df["quality"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

model = RandomForestClassifier()
model.fit(X_train, y_train)

preds = model.predict(X_test)
f1 = f1_score(y_test, preds, average="macro")

joblib.dump(model, "model.pkl")

with open("metrics.json", "w") as f:
    json.dump({"f1": f1}, f)

print("Training completed. F1:", f1)
