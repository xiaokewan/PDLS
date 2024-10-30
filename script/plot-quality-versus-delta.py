# -*- coding: utf-8 -*-

import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.ticker import FuncFormatter

# Function to format y-axis as percentage
def to_percentage(x, pos):
    return f'{(x*100):.0f}%'


legendFontSize = 11
fontScale = 1.3
df = pd.read_csv('./result/2023_1119_change_rarity_threshold/data.csv')
sns.set(font_scale=fontScale)

# Set style with a lighter grid
sns.set_style("whitegrid", {
    "axes.facecolor": "#ffffff",
    "grid.color": "#dadada",  # Light grey color for the grid lines
    "grid.linestyle": "--",    # Style of the grid line
    "grid.linewidth": 0.1,    # Width of the grid lines
})

# color_palette
# color_palette = plt.cm.tab10.colors

figSize=(5, 3)
plt.figure(figsize=figSize)
ax = sns.barplot(x='Circuit', y='Area Overhead', hue='Rarity Threshold', data=df, saturation=1.0, palette='tab10' )
ax.yaxis.set_major_formatter(FuncFormatter(to_percentage))
ax.legend(fontsize=legendFontSize, ncol=1, loc='upper left', bbox_to_anchor=(0.60, 1.00))
plt.xlabel('')
plt.tight_layout()
plt.savefig('./area_versus_delta.eps', dpi=1000)

plt.figure(figsize=figSize)
ax = sns.barplot(x='Circuit', y='Delay Overhead', hue='Rarity Threshold', data=df, saturation=1.0, palette='tab10')
ax.yaxis.set_major_formatter(FuncFormatter(to_percentage))
ax.legend(fontsize=legendFontSize, ncol=2, loc='upper left',bbox_to_anchor=(0.20, 1.15))
plt.xlabel('')
plt.tight_layout()
plt.savefig('./delay_versus_delta.eps', dpi=1000)

plt.figure(figsize=figSize)
ax = sns.barplot(x='Circuit', y='Power Overhead', hue='Rarity Threshold', data=df, saturation=1.0, palette='tab10')
ax.yaxis.set_major_formatter(FuncFormatter(to_percentage))
ax.legend(fontsize=legendFontSize, ncol=2, loc='upper left',bbox_to_anchor=(0.20, 1.10))
plt.xlabel('')
plt.tight_layout()
# plt.show()
plt.savefig('./power_versus_delta.eps', dpi=1000)

plt.figure(figsize=figSize)
ax = sns.barplot(x='Circuit', y='Rare Signal Reduction', hue='Rarity Threshold', data=df, saturation=1.0, palette='tab10')
ax.yaxis.set_major_formatter(FuncFormatter(to_percentage))
ax.legend(fontsize=legendFontSize, loc='upper left', ncol=2, bbox_to_anchor=(0.0, 1.05))
plt.xlabel('')
plt.tight_layout()
# plt.show()
plt.savefig('./rare_versus_delta.eps', dpi=1000)