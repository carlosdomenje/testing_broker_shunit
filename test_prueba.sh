#! /bin/sh

########################################################################
#	Test para saber si un cliente sin credenciales 
#	puede conectarse
########################################################################
testClienteAnonimo(){
 VALUE=$(mosquitto_pub -p 8883 -m hello -t /test -d | grep -o 'PUBLISH') 	
 assertFalse "$VALUE" "PUBLISH"
}

########################################################################
#	Test para saber si un cliente con solo usuario 
#	puede conectarse
########################################################################
testClienteConUsuario(){
 VALUE=$(mosquitto_pub -p 8883 -h localhost -u carlos -m hello -t /test -d | grep -o 'PUBLISH') 
 assertFalse "$VALUE" "PUBLISH"
}


########################################################################
#	Test para saber si un cliente con solo usuario 
#	y password puede conectarse
########################################################################
testClienteConUserYPass(){
 VALUE=$(mosquitto_pub -p 8883 -h localhost -u carlos -P carlos -m hello -t /test -d | grep -o 'PUBLISH') 
 assertFalse "$VALUE" "PUBLISH"
}


########################################################################
#	Test para saber si un cliente puede conectarse
#	con certificados validos
########################################################################
testClienteTLS(){
 VALUE=$(mosquitto_pub -p 8883 --cafile ../ca/ca.crt --cert ../client/client.crt --key ../client/client.key -h localhost -u carlos -P cars -m hello -t /test -d | grep -o 'PUBLISH') 	
 assertEquals "$VALUE" "PUBLISH"
}





