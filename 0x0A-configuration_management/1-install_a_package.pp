# install flask 1.1.1 from pip3
package { 'flask' :
    ensure   => '1.1.1',
    provider => 'pip3',
    }