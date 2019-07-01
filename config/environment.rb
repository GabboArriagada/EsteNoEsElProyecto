# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
class Date
MONTHNAMES = [nil] + %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre)
DAYNAMES = %w(Domingo, Lunes, Martes, Miercoles, Jueves, Viernes,Sabado)
module Format
    MONTHS = {'Enero'=>1,'Febrero'=>2,'Marzo'=> 3,'Abril'=> 4,'Mayo'=> 5, 'Junio'=> 6, 'Julio'=> 7, 'Agosto'=> 8,'Septiembre'=> 9, 'Octubre'  =>10, 'Noviembre' =>11, 'Diciembre'=>12}

    DAYS = {'Domingo'=> 0, 'Lunes'=> 1, 'Martes'=> 2, 'Miercoles'=> 3,'Jueves' => 4, 'Viernes'   => 5, 'Sabado' => 6}
end

end
