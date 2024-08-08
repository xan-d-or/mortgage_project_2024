## Luka Modrić >>> (honorary tribute)
Luka Modric collecting standing ovations like infinity stones. My absolute goat]


# Mortgage Project 2024


*8 декабря 2023 года вступило в силу решение Правительства России о запуске "арк- тической ипотеки— программы субсидирования ипотечных кредитов в северных регионах страны для педагогов, медработников, молодых семей и одиноких родителей. Основные её условия предполагают, что заёмщик может взять кредит до 6 миллионов рублей по ставке до 2% годовых1, то есть при введении такой программы некоторые люди получают воз- можность взять кредит под сниженную ставку. Это может привести к увеличению спроса на жилье в арктических регионах, из-за чего может вырасти цена на недвижимость. Таким образом, основная цель программы — сделать жилье доступнее для населения — окажется не достигнутой. В своей работе мы проверяем гипотезу, что введение арктической ипоте- ки в самом деле привело к росту цен на недвижимость в регионах воздействия или нет. Использование метода разности разностей на данных по городам не подтверждает эту гипотезу: рост цен в городах воздействия сопоставим с соседними регионами, в которых программа арктической ипотеки не вводилась.*

This repository contains code for sythetic control for our paper.


## Project Overview

This project is centered around the application of synthetic control methods. The analysis is conducted using two separate environments:
- **Python (Jupyter Notebook)**
- **R (R Script)**

The analysis is aimed at understanding how various changes in policy influence mortgage rates and genera mortgage avaliability.

## Repository Contents

- **`synthetic_control.ipynb`**: A Jupyter Notebook implementing synthetic control methods using Python. It utilizes libraries such as `SyntheticControlMethods`, `numpy`, `pandas`, `scipy`, and `cvxpy` to perform the analysis.
  
- **`synthetic_control.R`**: An R script that conducts a similar analysis using R's `Synth`, `SCtools`, and `scpi` libraries. It handles data preprocessing, model creation, and visualization of the results.

## Key Features

- **Data Preprocessing**: Cleaning and preparing mortgage-related data for analysis.
- **Synthetic Control Modeling**: Creation of synthetic controls to compare the impact of different events or policies on the mortgage market.
- **Cross-Validation**: Evaluating model performance and ensuring robustness.
- **Visualization**: Clear and informative plots to depict the effects of the synthetic control analysis.

## Dependencies

### Python
- `SyntheticControlMethods`
- `numpy`
- `pandas`
- `scipy`
- `cvxpy`
- `matplotlib`

### R
- `scpi`
- `Synth`
- `SCtools`
- `data.table`

Ensure you have all dependencies installed in your environment before running the scripts.

## How to Use

### Running the Python Notebook
1. Open `synthetic_control.ipynb` in Jupyter Notebook or Jupyter Lab.
2. Execute the cells in sequence to perform the analysis.
3. The notebook will install necessary packages if they are not already available in your environment.

### Running the R Script
1. Open `synthetic_control.R` in an R environment (e.g., RStudio).
2. Ensure the required libraries are installed.
3. Run the script to perform the synthetic control analysis on the provided data.

## Results and Interpretation



## Contributing

Contributions are welcome! If you have suggestions for improvements or additional features, feel free to submit a pull request or open an issue.

## License

This project is not licensed 
