class ComplexNumber

    $count={"add"=>0,"mulp"=>0}
    attr_accessor :real ,:imag

    def initialize(r , i)
        @real=r
        @imag=i
    end
    
    def +(cn1)
        $count["add"]=$count["add"]+1
        rSum=@real+cn1.real
        iSum=@imag+cn1.imag
        cn=ComplexNumber.new(rSum,iSum)
    end

    def *(cn1)
        $count["mulp"]=$count["mulp"]+1
        rMulp=(@real*cn1.real)-(@imag*cn1.imag)
        iMulp=(@real*cn1.imag)+(@imag*cn1.real)
        cn=ComplexNumber.new(rMulp,iMulp)
    end

    def self.bulk_add(cns)
        $count["add"]=$count["add"]+1
        cnSum=ComplexNumber.new(0,0)
        for cn in cns
            cnSum=cnSum+cn
        end
        cnSum
    end

    def self.bulk_multiply(cns)
        $count["mulp"]=$count["mulp"]+1
        cnMulp=ComplexNumber.new(1,0)
        for cn in cns
            cnMulp=cnMulp*cn
        end
        cnMulp
    end

    def self.get_stats
        puts "add count #{$count["add"]}"
        puts "multiply count #{$count["mulp"]}"
    end
    
    def self.print_com(cn)
        puts "#{cn.real} + ( #{cn.imag} )i"
    end

end

cn1=ComplexNumber.new(3,2)
cn2=ComplexNumber.new(1,7)
cn3=ComplexNumber.new(0,0)

#add
cn3=cn1+cn2
ComplexNumber.print_com(cn3)
cn4=cn1+cn3
ComplexNumber.print_com(cn4)

#multiply
cn3=cn1*cn2
ComplexNumber.print_com(cn3)


bulk=[cn1,cn2]

cn4=ComplexNumber.bulk_add(bulk)
ComplexNumber.print_com(cn4)

cn4=ComplexNumber.bulk_multiply(bulk)
ComplexNumber.print_com(cn4)

#stats
ComplexNumber.get_stats
