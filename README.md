
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dauf-exercise

<!-- badges: start -->
<!-- badges: end -->

The goal of dauf-exercise is to provide materials when working on an
exercise involving creation of a Quarto Dashboard.

## Exercise

> Create a [Quarto
> Dashboard](https://quarto.org/docs/dashboards/layout.html) using open
> data from [OpenAlex](https://openalex.org/Research.pdf) which
> highlights in which journals/venues the three universities KTH,
> Stockholm University and Karolinska Institutet have most frequently
> co-published in the last ten years. Render the content and bundle the
> result in a container as static web content to be served from the
> subpath “dashboards/dauf-exercise”.

Aspects to consider:

- The Quarto tooling is free and open source software allowing creation
  of outputs in various formats including an HTML-based Dashboard
  format. For the specific question in the exercise, provide **a tabular
  overview** but also **include other visuals**. Think of one or several
  useful ways of presenting the results in a comprehensible way. Feel
  free to explore and use [this gallery of Quarto Dashboard
  examples](https://quarto.org/docs/dashboards/examples/#r) for
  inspiration.

- Add some basic styling to the dashboard. You are free to use [any
  approach](https://quarto.org/docs/dashboards/theming.html) including
  styling assets for example from other places such as [this
  one](https://github.com/KTH-Library/bootswatch-kth).

- Create a container which renders the dashboard embedding all resources
  in a single file. Hint: quarto documents can utilize a yaml setting
  which embeds resources locally in the rendered output, see [the docs
  here](https://quarto.org/docs/reference/formats/html.html#rendering).

- Create a container which can serve the results as static web content
  from a sub-path such as “{servername}/dashboards/dauf-exercise”? Hint:
  `nginx` could be used as a base layer in the container with the output
  made available from a sub-path.

- Think about how the above approach for rendering and publishing a
  dashboard could be automated using GitHub Actions. Bonus points for
  providing a non-private cloned repo which includes a GitHub Action
  which renders the dashboard and publishes it to GitHub Pages
  periodically, say once per day.

- Look into the `qa.R` script, explain what it does and discuss your
  findings and thoughts around how you would proceed in a data quality
  investigation such as this one (where you discover a data quality
  issue in an external data source).

## Resources

It is not strictly required, but there are some resources at the KTH
Library which could potentially be used in the exercise:

- [`kontarion`](https://github.com/KTH-Library/kontarion) provides a
  container with Quarto, R and RStudio for the Web pre-installed. It
  could be used as a base image when rendering the dashboard in the
  exercise.

- [`kth-quarto`](https://github.com/KTH-Library/kth-quarto) contains
  styling assets that could potentially be used in the Dashboard. There
  is also [styling assets available
  here](https://github.com/KTH-Library/ktheme) which provide “KTH style”
  when creating plots using ggplot2.
