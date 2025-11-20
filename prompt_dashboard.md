# prompt_dashboard.md describes this project (Shinylive dashboard).

Based on ./prompt_dashboard.md, create/update 
  1) ./task.md and 
  2) ./implementation_plan.md 

# Shinylive app for Quarto dashboard vignette
+ deploying a 
    + Shinylive for R app 
    + inside Quarto vigette
    + inside the projects R package
+ references to digest 
  + https://posit-dev.github.io/r-shinylive/
  + https://quarto-ext.github.io/shinylive/
  + https://r-wasm.github.io/quarto-live/
    + https://parmsam.medium.com/package-tools-i-learned-about-at-posit-conf-2024-dbdd118ec14f§
    + https://github.com/coatless-quarto/r-shinylive-demo
  + https://nrennie.rbind.io/blog/webr-shiny-tidytuesday/

# daily updates
+ Add Daily workflow that runs targets::tar_make() in a nix shell to update the vignette(s) that contains dashboard pages 
+ via nix .github/workflows workflow
  + send email if there is failure to john.b.gavin+dashboard.daily@gmail.com

# Dashboard pages

## xkcd.com
+ page title 'xkcd cartoon'
+ dashboard page contains latest xkcd.com cartoon 
  + with the xkcd.com caption at bottom of image.
  + Click on image to jump to the appropriate xkdc related webpage that explains the context of the cartoon https://www.explainxkcd.com/wiki/index.php/Main_Page
    + the url for the related webpage appears when the mouse hovers over that image. 

## treasury daily interest rates page
+ Digest and use https://cran.r-project.org/web/packages/treasury/index.html
+ Targets pipeline generates daily treasury rates by categories
  + par yield curves
  + treasury bills
  + long-term rates
  + real yield curves
