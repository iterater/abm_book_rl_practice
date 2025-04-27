# Practice book on RL

## Progress
| |Chapter|Location|Status|
|-|-|-|-|
|0|Introduction|`intro.md`|✅ Done|
|1|Basic RL example with CartPole|`1_Basic_RL/1_RL_basics.ipynb`|✅ Done|
|2|Inverse RL|`2_Inverse_RL/2_IRL.ipynb.ipynb`|✅ Done|
|3|MARL|`3_MARL/MARL.ipynb`|✅ Done|
|4|RLHF|`4_RLHF/4_RLHF.ipynb`|TBD - Ashish|

## Chapter instruction

Each chapter is implemented in a form of single notebook (`.ipynb`) structured with the following sections in MarkDown. The notebook starts with chapter title (1st level header). Each section starts with 2nd level header. Sub-sections (3rd level headers) can be used for further structuring of sections.
- **Problem Definition.** Introduction of problem, basic knowledge, planned experiments, and applied methods. Diagrams, references, equations are good to illustrate this chapter.
- **Implementation.** Basic environment setup: code blocks with verbose explanation of what is done and obtained after cell's run.
- **Experiments.** Detailed implementation and run of experiments with explanation of the results.
- **Conclusion.** Summarization of the main observations and takeaways.
- **References.** References, if needed. Will be converted into complete book references.

## Building

The book composed with [JupyterBook](https://jupyterbook.org/). Building commands:
- for PDF: `build_pdf.sh`
- for HTML: `build_html.sh`
