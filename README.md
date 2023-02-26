# lahmancooper
Boilerplate for a dbcooper DB package using the Lahman SQLite database.

## Installation

### Install `dbcooper`

To install this package, you will first have to install `dbcooper`, which is not yet on CRAN:

```r
devtools::install_github("chriscardillo/dbcooper")
```

### Install `lahmancooper`

Once you have installed `dbcooper`, you can install `lahmancooper`:

```r
devtools::install_github("chriscardillo/lahmancooper")
```

## Usage

When loaded, this package creates accessor functions to the Lahman SQLite database, by utilizing the `dbcooper` function `dbc_init`.

Here is a short example of using the resulting accessor function, as well as a use-case-specific `summarize_salaries` function (also in this package), that illustrates how you utilize your existing `dplyr` knowledge to immediately work with your DB data.

```r
library(lahmancooper)
library(dplyr)

lahman_salaries() %>%
  group_by(year = year_id) %>%
  summarize_salaries() %>%
  arrange(desc(year))
```

## Development

The development process for a `dbcooper`-generated package is similar to other packages.

You will often find yourself creating or updating some function, followed by running the common...

```r
devtools::document()
devtools::load_all(export_all = False)
```

...and then continuing to develop your package.

The one thing that may feel different is, when first starting with a `dbcooper`-generated package, you'll have to create your `.onLoad` function in `R/zzz.R`, which might involve some rounds of iteration for successfully connecting to your databse and generating the accessor functions using `dbc_init` (or updated the `table_formatter` or `table_post` arguments).

When developing the `.onLoad` function, you'll have to restart R and reload your package (`devtools::load_all(export_all = False)`) to check changes to your `.onLoad` function.

Aside from the `.onLoad` development, developing a `dbcooper`-generated package is just like developing any other R package!
