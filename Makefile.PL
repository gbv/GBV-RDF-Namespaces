use 5.008006;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'GBV::RDF::Namespaces',
    VERSION_FROM => 'lib/GBV/RDF/Namespaces.pm',
    PREREQ_PM => {
        'RDF::Trine::NamespaceMap' => '0.135',
        'RDF::Trine::Namespace'    => '0.135',
    }
);

