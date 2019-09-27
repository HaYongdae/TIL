install.packages('rsconnect')
rsconnect::setAccountInfo(name='sikgu',
                          token='C5F685F1E01DEAE465210F1984B64C79',
                          secret='/O3nMv8FwkiK+JZezRNW8rsAUiNtEX6QEqFXYyjZ')
library(rsconnect)
rsconnect::deployApp('path/to/your/app')