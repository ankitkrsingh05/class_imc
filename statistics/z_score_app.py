import streamlit as st
import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt

# Function to calculate z-score
def calculate_z_score(sample_mean, population_mean, std_dev, n):
    return (sample_mean - population_mean) / (std_dev / np.sqrt(n))

# Streamlit app
st.title("Z-Test with Rejection Region Visualization")

# Input parameters
population_mean = st.number_input("Population Mean (μ)", value=50.0)
sample_mean = st.number_input("Sample Mean (x̄)", value=52.0)
std_dev = st.number_input("Standard Deviation (σ)", value=10.0)
n = st.number_input("Number of Samples (n)", value=30, step=1)
alpha = st.number_input("Significance Level (α)", value=0.05)

# Tail selection
tail_type = st.selectbox("Test Type", ("Two-Tailed", "Left-Tailed", "Right-Tailed"))

# Calculate z-score
z_score = calculate_z_score(sample_mean, population_mean, std_dev, n)
st.write(f"Calculated Z-Score: {z_score:.4f}")

# Determine critical z-value(s) based on tail type
if tail_type == "Two-Tailed":
    z_value = stats.norm.ppf(1 - alpha / 2)
    st.write(f"Critical Z-Value for α = {alpha} (Two-Tailed): ±{z_value:.4f}")
elif tail_type == "Left-Tailed":
    z_value = stats.norm.ppf(alpha)
    st.write(f"Critical Z-Value for α = {alpha} (Left-Tailed): {z_value:.4f}")
else:  # Right-Tailed
    z_value = stats.norm.ppf(1 - alpha)
    st.write(f"Critical Z-Value for α = {alpha} (Right-Tailed): {z_value:.4f}")

# Show row and column values from z-table (approximation)
row_value = int(abs(z_value) * 10) / 10  # Row value approximation
col_value = round(abs(z_value) - row_value, 2)  # Column value approximation

st.write(f"Z-Table Row Value: {row_value:.1f}")
st.write(f"Z-Table Column Value: {col_value:.2f}")

# Plotting the normal distribution with rejection region
x = np.linspace(-4, 4, 1000)
y = stats.norm.pdf(x)

plt.figure(figsize=(10, 5))
plt.plot(x, y, label="Normal Distribution")

# Rejection regions based on tail type
if tail_type == "Two-Tailed":
    plt.fill_between(x, y, where=(x < -z_value), color='red', alpha=0.5, label="Rejection Region (Left)")
    plt.fill_between(x, y, where=(x > z_value), color='red', alpha=0.5, label="Rejection Region (Right)")
elif tail_type == "Left-Tailed":
    plt.fill_between(x, y, where=(x < z_value), color='red', alpha=0.5, label="Rejection Region")
else:  # Right-Tailed
    plt.fill_between(x, y, where=(x > z_value), color='red', alpha=0.5, label="Rejection Region")

# Highlight the calculated z-score
plt.axvline(z_score, color='blue', linestyle='--', label=f'Z-Score = {z_score:.4f}')

# Display significance level
plt.axhline(y=0, xmin=0, xmax=1, color='black', linestyle='-')
if tail_type == "Two-Tailed":
    plt.text(-z_value, 0.02, f'α/2 = {alpha/2}', horizontalalignment='center', color='black')
    plt.text(z_value, 0.02, f'α/2 = {alpha/2}', horizontalalignment='center', color='black')
elif tail_type == "Left-Tailed":
    plt.text(z_value, 0.02, f'α = {alpha}', horizontalalignment='center', color='black')
else:  # Right-Tailed
    plt.text(z_value, 0.02, f'α = {alpha}', horizontalalignment='center', color='black')

plt.title("Z-Test: Rejection Region Visualization")
plt.xlabel("Z-Score")
plt.ylabel("Probability Density")
plt.legend()
st.pyplot(plt)
