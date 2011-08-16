## GBV::RDF::Namespaces

This Perl module defines a RDF::Trine::NamespaceMap with predefined URI 
namespaces for GBV applications. You can use it like this:

    # get at least version 0.1 and export namespace map as $ns
    our $ns;
    use GBV::RDF::Namespaces qw(0.1 $ns);

    $uri = $ns->frbr('item');   # returns a RDF::Trine::Resource
    $uri = $ns->uri('gbv:iln'); # returns a RDF::Trine::Resource

    print $uri->uri_value;      # stringify the URI value

    # or access the list of namespaces as:
    use GBV::RDF::Namespaces;
    my $ns = $GBV::RDF::Namespaces::NS;

## Keeping up-to-date

The latest version of this module can be found in a public git repository at
https://github.com/gbv/GBV-RDF-Namespaces  To keep up-to-date, you should
clone this repository and regularly update.

## Installation

    perl Makefile.PL
    make test
    make install

## How to contribute

If you are familiar with git, just fork and ask for a merge. You can also add
issues at https://github.com/gbv/GBV-RDF-Namespaces/issues

## License

Feel free to use this modules under the same conditions as Perl.

