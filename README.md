# Extensive benchmark for reasoning about regular properties

This repository contains benchmark automata that can be used to evaluate
various approaches to reasoning about regular properties. Our aim is to
create a wide benchmark used in automata community for evaluating novel
as well as past approaches with other tools.

> :warning: All of the benchmarks are kept in packed format (tgz). 
> Github advises users to keep the repositories as small as possible and
> we decided to comply with this request. For a brief time we provide link
> to repository that contains unpacked benchmarks in several additionl files. We warn that this 
> might be soon deleted (the repository is self hosted and takes more than 10 GB of data)
> 
For unpacked benchmarks see: [Benchmarks (mirror)](https://pajda.fit.vutbr.cz/ifiedortom/afa-comparison-benchmarks). 
The repository is a mirror of these benchmarks that were used in the comparison.
* Cloning our benchmarks from this mirror requires <code>git-lfs</code> support (see [git-lfs](https://git-lfs.com/))
* Note that the benchmarks are quite extensive and occupies more than 10GB of storage.

## Usage

Unpack the benchmarks:

    ./extract_benchmarks.sh

This will unpack the benchmarks into individual directories.

You can then use the benchmarks in your application, or you can
use our [replication package](https://www.fit.vutbr.cz/research/groups/verifit/tools/automata-bench.ova).

Note that in order to use the `.emp` files you will need some kind 
of interpreter of the file, since the files do not describe
automata, but programs with automata operations.

Similarly, to use `.afa` or `.mata` files you will need either some format converter or parser of
either of the formats.

## File formats

  * `.mata` is our own format (see [AUTOMATAFORMAT.md](https://github.com/VeriFIT/mata/blob/devel/AUTOMATAFORMAT.md))
  for various types of automata (AFA, NFA, DFA ,etc.) 
  * `.afa` is an intermediate format for AFA automata, that can be converted to other AFA formats
  supported by other tools (see [v1_checker](https://github.com/p4l1ly/automata-safa/tree/v1_checker)).
  * `.smt2` contains formulae in SMTLIB that are passed to SMT solvers, such as Z3 or CVC5.
  * `.emp` is our own specification of simple programs, that contains automata operations.
  * `gen_aut/` directory contains source automata for `.emp` files
  * `.ltlf` and `.pltl` contains original formulae of LTL logic that were used to generate the
    benchmarks.

### Generated formats

You can use `generate_afa_benchmarks.sh` to generate additional formats. Either
(1) run the script without any parameters (then by default all of our selected
benchmarks will be transformed), (2) run the script as
`./generate_afa_benchmarks.sh file.afa` to convert single `.afa` benchmark to
four selected formats (`.aig`, `.ada`, `.afasat`, `.bisim`), or, (3) run the
script as `./generate_afa_benchmarks.sh dir` to generate all `*.afa` files
found in the directory `dir`.

This way, we additionaly support the following formats:
  * `.aig`: format supported by bwIC3 (a checker based on IC3 algorithm build upon ABC model checker).
  * `.ada`: format supported by JAltImpact tool, an implementation o finterpolation-based algorithm.
  * `.afasat`: format supported by Antisat, our own implementation of antichain AFA emptiness test
    integrated with SAT solver.
  * `.bisim`: format supported by Bisim, an implementation of the AFA-emptiness check based on bisimulation.

## File naming conventions 

There are no fixed naming conventions for the benchmarks. We only request to provide the benchmark
either in `.afa` or `.mata` file. This way we can convert them to other formats.

The benchmarks contain following formats and files:

## Benchmark description

We divided benchmarks into two sets: `b-*` models boolean combinations of regular expression benchmarks,
while `a-*` models AFA benchmarks.

Note that there are some formulae, that do not fit into one of these categories. We omitted them
from our experiments, as they were not that interesting.

 1. `b-smt` contains 330 string constraints from the Norn and SyGuS-qgen, collected in
    SMT-LIB benchmark <a href="http://smtlib.cs.uiowa.edu/">[8]</a>, that fall in BRE.
    This includes following directories:
     * `bool_comb/ere/QF_SLIA_Norn`
     * `bool_comb/ere/QF_S_sygus_qgen`

 2. `b-regex`contains 500 problems, obtained analogously as in
    <a href="https://www.cs.princeton.edu/~zkincaid/pub/mfps17.pdf">[30]</a>  and
    <a href="https://dl.acm.org/doi/10.1007/978-3-030-89051-3_14">[77]</a>,
    from RegExLib <a href="https://regexlib.com/">[71]</a>.
    This includes following directories:
    * `email_filter`

 3. `b-hand-made` has 56 difficult handwritten problems from
    <a href="https://web.cs.ucdavis.edu/~cdstanford/doc/2021/PLDI21.pdf">[73]</a>
    containing membership
    in regular expressions extended with intersection and complement. They encode (1)
    date and password problems, (2) problems where Boolean operations interact with
    concatenation and iteration, and (3) problems with exponential determinization.
    This includes following directories:
      * `bool_comb/ere/boolean_and_loops`
      * `bool_comb/ere/date`
      * `bool_comb/ere/det_blowup`
      * `bool_comb/ere/password`

 4. `b-armc-incl` contains 171 language inclusion problems from runs of abstract regular
    model checking tools (verification of the bakery algorithm, bubble sort, and a producer-
    consumer system) of <a href="http://www.lsv.fr/Publis/PAPERS/PDF/bhhtv-ciaa08.pdf">[12]</a>.
    This includes following directories:
    * `automata-inclusion`

 5. `b-param` has 8 parametric problems. Four are from
<a href="https://jorgenavas.github.io/papers/regex-tacas13.pdf">[40]</a>.
Another four are from <a href="https://arxiv.org/abs/1708.09073">[28]</a>.
    This includes following directories:
      * `bool_comb/cox`
      * `bool_comb/intersect`

  6. `a-ltl-rand` contains 300 LTLf formulae obtained with the random generator of
     <a href="https://dl.acm.org/doi/10.1007/978-3-030-89051-3_14">[77]</a>.
     The generator traverses the syntactic tree of the LTL grammar, and is controlled by
     the number of variables, probabilities of connectives, maximum depth, and average
     depth.We have set the parameters empirically in a way likely to generate examples
     difficult for the compared solvers (the formulae have 6 atomic propositions and
     maximum depth 16).
     This includes following directories:
      * `ltl_afa/random_ltl`
  7. `a-ltl-param` has a pair of hand-made parametric LTLf formulae (160 formulae each)
        used in <a href="https://www.cs.princeton.edu/~zkincaid/pub/mfps17.pdf">[30]</a> and <a href="https://dl.acm.org/doi/10.1007/978-3-030-89051-3_14">[77]</a>:
        Lift <a href="https://www.researchgate.net/publication/268057427_Symbolic_Strategy_Synthesis_For_Games_With_LTL_Winning_Conditions">[43]</a>
        describes a simple lift operating on a parametric number of floors and
        Counter <a href="https://www.cs.rice.edu/~vardi/papers/spin07rj.pdf">[72]</a>
        describes a counter incremented modulo the parameter.
        This includes following directories:
     * `ltl_afa/parametric_ltl`
  8. `a-ltl-spec` <a href="https://arxiv.org/abs/1811.03176">[60]</a>
     contains 62 LTLf formulae that specify realistic systems, used by Boeing
     <a href="https://es-static.fbk.eu/projects/air6110/download/CAV2015_paper.pdf">[14]</a>
     and NASA <a href="https://es-static.fbk.eu/projects/nasa-aac/download/CAV2016_paper.pdf">[42]</a>.
     The formulae represent specifications used for designing
     Boeing AIR 6110 wheel-braking system and for designing NASA NextGen air traffic
     control (ATC) system.
        This includes following directories:
     * `ltl_afa/created_ltl/nasa-boeing`
  9. `a-ltlf-patterns` comes from transformation of linear temporal logic formulae over finite
     traces (LTLf) to AFA <a href="https://www.cs.rice.edu/~vardi/papers/ijcai13.pdf">[34]</a>.
     The 1699 formulae are from [60]8 and they represent
     common LTLf patterns which can be divided into two groups: (1) 7 parametric patterns
     (100 each) and (2) randomly generated conjunctions of simpler LTLf patterns
     (999 formulae).
        This includes following directories:
     * `ltl_afa/created_ltl/LTLf-specific`
  10. `a-sloth` 4062 AFA emptiness problems to which the string solver Sloth reduced string
      constraints <a href="https://www.fit.vutbr.cz/~vojnar/Publications/hljrv-popl18.pdf">[47]</a>.
      The AFA have complex multi-track transitions encoding Boolean
      operations and transductions, and a special kind of synchronization of traces requiring
      complex initial and final conditions.
      This includes following directories:
      * `stranger_afa`
  11. `a-noodler` 13840 AFA emptiness problems that correspond to certain sub-problems
      solved within the string solver Noodler in <a href="https://arxiv.org/abs/2212.02317">[10]</a>.
      The AFA were created similarly as
      those of <code>a-sloth</code>, but encode a different particular set of operations over different
      input automata.
         This includes following directories:
      * `noodler`

## Published work

* *Lukáš Holík, Tomas Fiedor, Adam Rogalewicz, Pavol Vargovčík, Martin Hruska and Juraj Síč: Reasoning about Regular Properties: A Comparative Study. In Proc. of CADE'23, 2023.*
    * See the [core site](https://www.fit.vutbr.cz/research/groups/verifit/tools/afa-comparison/) for more information,
      updates and many more.
    * [arXiv preprint](https://arxiv.org/abs/2304.05064): preprint of the paper.
    * For more recent version of the paper, either check the official [CADE'23](https://easyconferences.eu/cade2023/) submission or newer version in the arXiv
    * [Replication package](https://www.fit.vutbr.cz/research/groups/verifit/tools/automata-bench.ova): A virtual machine for replication of our results
        * The replication package is in `.ova` format and needs to be imported in some virtual image manager (see, e.g., [VirtualBox](https://www.virtualbox.org/) or [VMware](https://www.vmware.com/).
        * The replication packages occupies about 10GB of data.</li>
    * [Results](https://github.com/VeriFIT/afa-comparison-results): results of the comparison.

## Contributing

Our repositories are open for forking, enabling interested individuals to explore,
modify, and build upon our codebase. We wish to extend this benchmark with other 
problems and sources that could enhance the comparison of all widely used and presented tools.

If you are interested in contributing your own benchmark
we suggest following:

1. Fork this repository.
2. Add your own benchmark formulae, preferably in `.mata` or `.afa` format. See our format 
   description above. If you need help with converting your format into one of our formats
   contact us. We have scripts capable of converting between different formats supported
   by other tools.
3. Create a Pull Request from your fork. We will check your contribution, optionally request
   changes and if we are satisfied, we will merge the changes into our repository.
4. Please, in your pull request include the following:
   * Describe your benchmark: how it was obtained, whether it was generated, the origin of the 
     problem it models, etc.
   * Submit your benchmark in either `.zip` or `tgz`. This is due to a fact, that Github asks 
     developers to keep their repositories as small as possible.
   * If your benchmark is part of some paper or other work, please include citation to these works.

For other ways of contributing to our project refer to our [main site](https://www.fit.vutbr.cz/research/groups/verifit/tools/afa-comparison/#contributing)

## Change log

* **5.6.2023**: Initial version of benchmarks

## Contact Us

* Tomas Fiedor &lt;[ifiedortom@fit.vutbr.cz](mailto:ifiedortom@fit.vutbr.cz)&gt;
* **Lukas Holik** &lt;[holik@fit.vutbr.cz](mailto:holik@fit.vutbr.cz)&gt;
* Martin Hruska &lt;[ihruska@fit.vutbr.cz](mailto:ihruska@fit.vutbr.cz)&gt;
* Adam Rogalewicz &lt;[rogalew@fit.vutbr.cz](mailto:rogalew@fit.vutbr.cz)&gt;
* Juraj Sic &lt;[sicjuraj@fit.vutbr.cz](mailto:sicjuraj@fit.vutbr.cz)&gt;
* Pavol Vargovcik &lt;[ivargovcik@fit.vutbr.cz](mailto:ivargovcik@fit.vutbr.cz)&gt;

## Acknowledgements

This work has been supported by the Czech Ministry of Education, Youth and Sports
ERC.CZ project LL1908, and the FIT BUT internal project FIT-S-20-6427.
