/* 
  Este modelo es sólo un ejemplo para mostrar 
  una lista de las solicitudes, pueden cambiarlo 
  si quieren
*/

class PlantFamily {
  String name;

  PlantFamily(this.name);

  PlantFamily.fromJson(Map<String, dynamic> json) : name = json['family_name'];
}
