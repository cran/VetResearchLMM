#' @title    Examp2.5.2.1 from Duchateau, L. and Janssen, P. and Rowlands, G. J. (1998).\emph{Linear Mixed Models. An Introduction with applications in Veterinary Research}. International Livestock Research Institute.
#' @name     Examp2.5.2.1
#' @docType  data
#' @keywords datasets
#' @description Examp2.5.2.1 is used for inspecting probability distribution and to define a plausible process through
#' linear models and generalized linear models.
#' @author \enumerate{
#'          \item  Muhammad Yaseen (\email{myaseen208@@gmail.com})
#'          }
#' @references \enumerate{
#' \item Duchateau, L. and Janssen, P. and Rowlands, G. J. (1998).\emph{Linear Mixed Models. An Introduction with applications in Veterinary Research}.
#'              International Livestock Research Institute.
#'  }
#' @seealso
#'    \code{\link{ex124}}
#' @importFrom ggplot2 ggplot
#' @importFrom lme4 lmer
#' @importFrom lmerTest lsmeans
#' @examples
#' #-------------------------------------------------------------
#' ## Example 2.5.2.1 p-68
#' #-------------------------------------------------------------
#'  # PROC MIXED DATA=ex125;
#'  # CLASS drug dose region;
#'  # MODEL pcv=drug dose drug*dose / solution covb;
#'  # RANDOM region drug*region;
#'  # LSMEANS drug*dose;
#'  # RUN;
#'  
#' library(lme4)
#' str(ex125)
#' 
#' fm2.10 <- lme4::lmer(formula = Pcv ~ dose*Drug + (1|Region/Drug), data=ex125, REML = TRUE, 
#'                    contrasts = list(dose = "contr.SAS", Drug = "contr.SAS")
#'                    )
#' summary(fm2.10)
#' anova(fm2.10)
#' summary(fm2.10)$vcov
#' library(lmerTest)  
#' lmerTest::lsmeans(model = fm2.10, test.effs="dose:Drug")
NULL