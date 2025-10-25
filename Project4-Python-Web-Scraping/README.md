# 🎬 Web Scraping Oscar-Winning Movies with Python  

## 📖 Overview  
This project demonstrates how to use **Python web scraping techniques** to extract structured data from **Wikipedia**. Specifically, it collects information about **Oscar-winning movies** into a clean, well-organized **CSV file**.   

---

## 🎯 Objectives  
- Automating the extraction of Oscar-winning movie data from Wikipedia.  
- Cleaning and structure the extracted data using Pandas.  
- Export the processed data into a CSV file for analysis.  
- Demonstrate good web scraping practices (e.g., respecting website policies, avoiding over-requests).  

---

## 🧠 Skills Demonstrated  
- **Web Scraping** using `requests` and `BeautifulSoup`  
- **Data Cleaning** and **DataFrame creation** with `pandas`  
- **File Export** in CSV format  
- **Automation & Data Retrieval** from public web sources  

---

## 🧩 Tools and Libraries Used  
- **Python**  
- **BeautifulSoup (bs4)** – HTML parsing  
- **Requests** – fetching webpage content  
- **Pandas** – structuring and exporting data  
- **Jupyter Notebook / VS Code** – development environment  

---

## 📂 Workflow Summary  

1. **Fetch the Wikipedia Page**  
   - Send a request to the target Wikipedia URL containing Oscar-winning movies.  

2. **Parse the HTML**  
   - Use BeautifulSoup to locate and extract relevant table data.  

3. **Create a DataFrame**  
   - Convert parsed HTML data into a structured pandas DataFrame.  

4. **Clean and Organize the Data**  
   - Handle missing values, fix column names, and ensure consistency.  

5. **Export to CSV**  
   - Save the clean dataset as `oscar_winners.csv` for use in data visualization or analysis tools.  

---

## 📊 Example Output  

| Year | Movie Title | Award Category | Director |
|------|--------------|----------------|-----------|
| 2024 | Oppenheimer | Best Picture | Christopher Nolan |
| 2023 | Everything Everywhere All at Once | Best Picture | Daniel Kwan & Daniel Scheinert |
| 2022 | CODA | Best Picture | Siân Heder |

> 💾 *All results are saved in a CSV file named:*  
> `oscar_winners.csv`

---

## ⚙️ How to Run the Project  

```bash
# 1️⃣ Clone the repository
git clone https://github.com/yourusername/Web-Scraping-Oscar-Movies.git

# 2️⃣ Navigate to the project folder
cd Web-Scraping-Oscar-Movies

# 3️⃣ Install required libraries
pip install requests beautifulsoup4 pandas

# 4️⃣ Run the script
python oscar_scraper.py
