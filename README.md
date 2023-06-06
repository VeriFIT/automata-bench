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
