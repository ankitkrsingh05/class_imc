import streamlit as st
import numpy as np
import matplotlib.pyplot as plt

# Streamlit App
st.title("Interactive Scatter Plot with Linear Fit and SSE Visualization")

st.sidebar.header("Adjust Line Parameters")
m = st.sidebar.slider("Slope (m)", -10.0, 10.0, 2.5, 0.1)
b = st.sidebar.slider("Intercept (b)", -20.0, 20.0, 0.0, 0.1)

# Option to toggle SSE visualization
show_sse = st.sidebar.checkbox("Show Sum of Squared Error (SSE)", False)
# Option to toggle label values
show_labels = st.sidebar.checkbox("Show SSE Labels", True)
# Option to toggle trend line
show_trend_line = st.sidebar.checkbox("Show Trend Line", True)

# Option to adjust the number of data points
num_points = st.sidebar.slider("Number of Data Points", 10, 500, 100, 10)

# Generate some nearly linear data points based on the selected number of points
np.random.seed(42)
x = np.linspace(0, 10, num_points)
y = 2.5 * x + np.random.normal(0, 2, x.size)  # Line with some noise

# Calculate the line with the selected parameters
y_line = m * x + b

# Create the plot with fixed axis limits
fig, ax = plt.subplots()
ax.scatter(x, y, color='blue', label='Data Points')

# Plot the trend line if the option is enabled
if show_trend_line:
    ax.plot(x, y_line, color='red', label=f'Line: y = {m}x + {b}')

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.legend()

# Set fixed limits for x and y axes
ax.set_xlim([x.min(), x.max()])
ax.set_ylim([y.min() - 5, y.max() + 5])  # Adjust to provide some padding

# Display SSE if the option is enabled
if show_sse:
    for i in range(len(x)):
        # Draw a line between actual and predicted points
        ax.plot([x[i], x[i]], [y[i], y_line[i]], color='green', linestyle='dotted')
        # Label the distance if the option is enabled
        if show_labels:
            ax.text(x[i], (y[i] + y_line[i]) / 2, f'{(y[i] - y_line[i]):.2f}', 
                    color='purple', fontsize=8, ha='right')

# Display the plot in the Streamlit app
st.pyplot(fig)
