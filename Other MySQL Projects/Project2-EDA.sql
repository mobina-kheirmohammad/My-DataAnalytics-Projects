SELECT *
FROM layoffs_staging2;


SELECT MIN(total_laid_off) , MAX(total_laid_off)
FROM layoffs_staging2;


SELECT MIN(`date`) , MAX(`date`)
FROM layoffs_staging2;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT SUBSTRING(`date`, 6, 2) AS `Month`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `Month`
ORDER BY 1;

SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1;

WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS T_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1
)
SELECT `Month` , T_off, SUM(T_off) OVER (ORDER BY `Month`) AS rolling_total
FROM Rolling_Total;


SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY YEAR(`date`);


WITH Company_Year (company , years, T_offs) AS
(SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
)
SELECT *, DENSE_RANK () OVER(PARTITION BY years ORDER BY T_offs DESC) AS layoffs_ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY layoffs_ranking;


WITH Company_Year (company , years, T_offs) AS
(SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
) , Company_Year_layoffsranking AS
(
SELECT *, DENSE_RANK () OVER(PARTITION BY years ORDER BY T_offs DESC) AS layoffs_ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY years)
SELECT * 
FROM Company_Year_layoffsranking
WHERE layoffs_ranking <= 5;