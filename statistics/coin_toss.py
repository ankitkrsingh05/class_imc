import streamlit as st
import numpy as np
from scipy.stats import binom
import matplotlib.pyplot as plt

# Set up the Streamlit interface
st.title("Understanding p-value using a Coin Toss Binomial Distribution")

# Fixed number of trials
n_trials = 100

# User inputs for probability of success and observed successes
p_success = st.slider("Probability of Success (p)", min_value=0.0, max_value=1.0, value=0.5)
observed_successes = st.slider("Observed Number of Successes (k)", min_value=0, max_value=n_trials, value=50)

# Calculate p-value using binomial distribution
p_value = binom.sf(observed_successes-1, n_trials, p_success)

# Show results
st.subheader("Results")
st.write(f"Number of Trials (n): {n_trials}")
st.write(f"Probability of Success (p): {p_success}")
st.write(f"Observed Number of Successes (k): {observed_successes}")
st.write(f"Calculated p-value: {p_value:.4f}")

# Explanation
st.subheader("Explanation")
st.write("""
The p-value is the probability of observing a result at least as extreme as the observed one, assuming the null hypothesis is true.
In this case, the null hypothesis is that the coin is fair with a probability of success (heads) of 0.5.

For a coin toss:
- **n**: Total number of coin tosses (fixed at 100).
- **p**: Probability of getting heads (success) on each toss.
- **k**: Number of heads (successes) observed.

The p-value is calculated using the binomial distribution's survival function (sf), which gives the probability of observing at least `k` successes in `n` trials.
""")

# Adding a plot
x = np.arange(0, n_trials + 1)
binom_pmf = binom.pmf(x, n_trials, p_success)

fig, ax = plt.subplots()
ax.bar(x, binom_pmf, color='blue')
ax.axvline(observed_successes, color='red', linestyle='--', label=f'Observed k={observed_successes}')
ax.legend()
ax.set_xlabel('Number of Successes (k)')
ax.set_ylabel('Probability Mass Function (PMF)')
ax.set_title('Binomial Distribution')

st.pyplot(fig)
