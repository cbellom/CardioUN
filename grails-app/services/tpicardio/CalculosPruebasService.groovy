package tpicardio

class CalculosPruebasService {
	
	double calculoVo2(int frecuenciaDeRecuperacion , String genero){
		if(genero==Usuario.genero_mujer){
			return 65.81-(0.1847*frecuenciaDeRecuperacion)
		}else if (genero==Usuario.genero_hombre){
			return 111.33-(0.42*frecuenciaDeRecuperacion)
		}
	}
	
	double imc(double peso, double talla){
		return peso/(talla*talla);
	}
	
	double frecuenciaMax(int edad){
		return 207-( 0.8 *edad)
	}
	
	double frecuenciaPrueba(int lat15Sec){
		return lat15Sec*4
	}
	
	String clasificacionImc(double imc){
		if(imc<18.5){
			return "Bajo peso"
		}else if(imc<=24.9){
			return "Normal"
		}else if(imc<=29.9){
			return "Sobrepeso"
		}else if(imc<=34.9){
			return "Obeso clase I"
		}else if(imc<=39.9){
			return "Obeso clase II"		
		}else if(imc>=40){
			return "Obeso clase III"
		}
	}
	
	String calificacionFlexibilidad(double flexi, String genero){
		if(genero=="Mujer"){
			if(flexi<=32){
				return "Pobre"
			}else if(flexi<=36.5){
				return "Malo"
			}else if(flexi<=40){
				return "Regular"
			}else if(flexi<=42){
				return "Bueno"
			}else if(flexi>42){
				return "Excelente"
			}
		}
		if(genero=="Hombre"){
			if(flexi<=29.5){
				return "Pobre"
			}else if(flexi<=34){
				return "Malo"
			}else if(flexi<=38){
				return "Regular"
			}else if(flexi<=43){
				return "Bueno"
			}else if(flexi>43){
				return "Excelente"
			}
		}
	}
	
	String grupo(String vo2Max,String imc,String porcentGraso){
		if(vo2Max == "muy Pobre"||vo2Max == "pobre"||vo2Max == "regular"){
			return "A"
		}else if((vo2Max == "regular"||vo2Max == "promedio") 
				&& (imc == "Sobrepeso"||imc == "Obeso clase I"||imc == "Obeso clase II"||imc == "Obeso clase III")
				&& (porcentGraso == "Exceso de grasa" || porcentGraso == "Obesidad")){
			return "B"
		}else if((vo2Max == "regular"||vo2Max == "promedio") && (imc == "Normal") 
				&& (porcentGraso == "Saludable" || porcentGraso == "Insuficiente grasa")){
			return "C"
		}else if((vo2Max == "Bueno"||vo2Max == "Excelente" && (imc == "Normal")) 
				&& (porcentGraso == "Exceso de grasa" || porcentGraso == "Obesidad")){
			return "D"
		}else if((vo2Max == "Bueno"||vo2Max == "Excelente" && (imc == "Normal")) 
				&& (porcentGraso == "Saludable" || porcentGraso == "Insuficiente grasa")){
			return "E"
		}else if(imc == "Bajo peso"){
			return "F"
		}
	}
	
	String porcentajeGraso(String genero,int edad, int porcentGrasa){
		if(genero==Usuario.genero_mujer){
			if(edad>=16 && edad<=39){
				if(porcentGrasa<=22){
					return "Insuficiente grasa"
				}else if(porcentGrasa <=33){
					return "Saludable"
				}else if(porcentGrasa <=39){
					return "Exceso de grasa"
				}else if(porcentGrasa >39){
					return "Obesidad"
				}
			}else if(edad>=40 && edad<=59){
				if(porcentGrasa <=23){
					return "Insuficiente grasa"
				}else if(porcentGrasa <=34){
					return "Saludable"
				}else if(porcentGrasa <=40){
					return "Exceso de grasa"
				}else if(porcentGrasa >40){
					return "Obesidad"
				}
			}else if(edad>=60||edad<=79){
				if(porcentGrasa <=24){
					return "Insuficiente grasa"
				}else if(porcentGrasa <=36){
					return "Saludable"
				}else if(porcentGrasa <=42){
					return "Exceso de grasa"
				}else if(porcentGrasa >42){
					return "Obesidad"
				}
			}
		}else if(genero==Usuario.genero_hombre){
			if(edad>=16 && edad<=39){
				if(porcentGrasa <=8){
					return "Insuficiente grasa"
				}else if(porcentGrasa <=20){
					return "Saludable"
				}else if(porcentGrasa <=25){
					return "Exceso de grasa"
				}else if(porcentGrasa >25){
					return "Obesidad"
				}
			}else if(edad>=40 && edad<=59){
				if(porcentGrasa <=11){
					return "Insuficiente grasa"
				}else if(porcentGrasa <=22){
					return "Saludable"
				}else if(porcentGrasa <=38){
					return "Exceso de grasa"
				}else if(porcentGrasa >38){
					return "Obesidad"
				}
			}else if(edad>=60 && edad<=79){
				if(porcentGrasa <=13){
					return "Insuficiente grasa"
				}else if(porcentGrasa <=25){
					return "Saludable"
				}else if(porcentGrasa <=35){
					return "Exceso de grasa"
				}else if(porcentGrasa >35){
					return "Obesidad"
				}
			}
		}
		
	}
		
	String vo2Max(String genero,int edad, double vo2){
		if(genero==Usuario.genero_mujer){
			if(edad<=29){
				if(vo2 >=39.55){
					return "Excelente"
				}else if(vo2>=35.95){
					return "Bueno"
				}else if(vo2>=34.5){
					return "Promedio"
				}else if(vo2>=33.05){
					return "Regular"
				}else if(vo2 >=31.45){
					return "Pobre"
				}else if(vo2<31.45){
					return "Muy pobre"
				}			
			}else if(edad<=39){
				if(vo2 >=37.65){
					return "Excelente"
				}else if(vo2>=34.2){
					return "Bueno"
				}else if(vo2>=33.05){
					return "Promedio"
				}else if(vo2>=31.4){
					return "Regular"
				}else if(vo2 >=29.6){
					return "Pobre"
				}else if(vo2<29.6){
					return "Muy pobre"
				}
			}else if(edad<=49){
				if(vo2 >=35.05){
					return "Excelente"
				}else if(vo2>=31.6){
					return "Bueno"
				}else if(vo2>=30.2){
					return "Promedio"
				}else if(vo2>=28.9){
					return "Regular"
				}else if(vo2 >=27.4){
					return "Pobre"
				}else if( vo2<27.4){
					return "Muy pobre"
				}
			}else if(edad<=59){
				if(vo2 >=31.6){
					return "Excelente"
				}else if(vo2>=28.8){
					return "Bueno"
				}else if(vo2>=27.55){
					return "Promedio"
				}else if(vo2>=26.2){
					return "Regular"
				}else if(vo2 >=24.9){
					return "Pobre"
				}else if(vo2<24.9){
					return "Muy pobre"
				}
			}else if(edad>59){
				if(vo2 >=30.3){
					return "Excelente"
				}else if(vo2>=26.5){
					return "Bueno"
				}else if(vo2>=25.15){
					return "Promedio"
				}else if(vo2>=24.15){
					return "Regular"
				}else if(vo2 >=23.3){
					return "Pobre"
				}else if(vo2<23.3){
					return "Muy pobre"
				}
			}
		}else if(genero==Usuario.genero_hombre){
			if(edad<=29){
				if(vo2>=47.5){
					return "Excelente"
				}else if(vo2>=43.35){
					return "Bueno"
				}else if(vo2>=41.75){
					return "Promedio"
				}else if(vo2>=40.25){
					return "Regular"
				}else if(vo2>=38.3){
					return "Pobre"
				}else if(vo2<38.3){
					return "Muy pobre"
				}
			}else if(edad<=39){
				if(vo2>=45.7){
					return "Excelente"
				}else if(vo2>=41.7){
					return "Bueno"
				}else if(vo2>=39.95){
					return "Promedio"
				}else if(vo2>=38.15){
					return "Regular"
				}else if(vo2>=36.4){
					return "Pobre"
				}else if(vo2<36.4){
					return "Muy pobre"
				}
			}else if(edad<=49){
				if(vo2>=42.95){
					return "Excelente"
				}else if(vo2>=39){
					return "Bueno"
				}else if(vo2>=37.4){
					return "Promedio"
				}else if(vo2>=35.9){
					return "Regular"
				}else if(vo2>=34.05){
					return "Pobre"
				}else if(vo2<34.05){
					return "Muy pobre"
				}
			}else if(edad<=59){
				if(vo2>=39.75){
					return "Excelente"
				}else if(vo2>=35.95){
					return "Bueno"
				}else if(vo2>=34.5){
					return "Promedio"
				}else if(vo2>=33.05){
					return "Regular"
				}else if(vo2>=31.25){
					return "Pobre"
				}else if(vo2<31.25){
					return "Muy pobre"
				}
			}else if(edad>59){
				if(vo2 >=36.7){
					return "Excelente"
				}else if(vo2>=32.7){
					return "Bueno"
				}else if(vo2>=31){
					return "Promedio"
				}else if(vo2>=29.45){
					return "Regular"
				}else if(vo2>=27.6){
					return "Pobre"
				}else if(vo2<27.6){
					return "Muy pobre"
				}
			}
		}	
	}	
}
