import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homepagesate();
  }

}

class homepagesate extends State<HomePage>{

  String buttontext;
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  void buttonpressed(String buttontext){

    setState(() {
      if(buttontext=="C")
        {

          equation="0";
          result="0";
          equationFontSize = 38.0;
          resultFontSize = 48.0;

        }
      else if(buttontext=="⌫")
        {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
            equation=equation.substring(0,equation.length-1);
            if(equation=="")
            {
              equation="0";
            }

        }
      else if(buttontext=="=")
        {
          equationFontSize = 38.0;
          resultFontSize = 48.0;
          expression=equation;
          expression=expression.replaceAll('×', '*');
          expression= expression.replaceAll('÷', '/');

          try{

            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm= ContextModel();
            result='${exp.evaluate(EvaluationType.REAL, cm)}';

          }catch(e){
            result="Error";
          }

        }
      else
        {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          if(equation=="0"){
            equation=buttontext;
          }else{
            equation=equation+buttontext;
          }

        }




    });

  }

  Widget buttonbuilder(String buttontext,double buttonheight , Color buttoncolor ){
   return Container(
        height: MediaQuery.of(context).size.height*0.1*buttonheight,
        color: buttoncolor,
        child:FlatButton(
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
          padding: const EdgeInsets.all(16.0),
          onPressed: ()=>buttonpressed(buttontext),
          child: Text(
            buttontext,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),

        )


    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator",style: new TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold
        ),),
      ),

      body: new Container(
        //padding:const EdgeInsets.all(5.0),
        child: Center(
          child: new Column(
            children: <Widget>[
               Card(
                elevation:4.0,
                child: Container(
                  padding:  const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  border: Border.all(
                      color:Colors.blue[300],
                      style:BorderStyle.solid,
                      width: 1
                    )
                  ),

                  child: new Text(equation,
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize:equationFontSize,

                    ),
                    textAlign: TextAlign.right,
                  ),


              )
              ),

             Card(
                  elevation:4.0,
                  child: Container(
                    padding:  const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:Colors.blue[300],
                            style:BorderStyle.solid,
                            width: 1
                        )
                    ),

                    child: new Text(result,
                      style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        fontSize: resultFontSize,

                      ),
                      textAlign: TextAlign.right,
                    ),


                  )
              ),

              Expanded(
                child:Divider(),

              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    child: Table(
                      children:[
                        TableRow(
                            children: [

                              buttonbuilder("C", 1, Colors.redAccent),
                              buttonbuilder("⌫", 1, Colors.blue),
                              buttonbuilder("÷", 1, Colors.blue),


                            ]

                        ),

                        TableRow(
                            children: [

                              buttonbuilder("7", 1, Colors.black45),
                              buttonbuilder("8", 1, Colors.black45),
                              buttonbuilder("9", 1, Colors.black45),

                            ]

                        ),
                        TableRow(
                            children: [

                              buttonbuilder("4", 1, Colors.black45),
                              buttonbuilder("5", 1, Colors.black45),
                              buttonbuilder("6", 1, Colors.black45),

                            ]

                        ),
                        TableRow(
                            children: [

                              buttonbuilder("1", 1, Colors.black45),
                              buttonbuilder("2", 1, Colors.black45),
                              buttonbuilder("3", 1, Colors.black45),

                            ]

                        ),
                        TableRow(
                            children: [

                              buttonbuilder(".", 1, Colors.black45),
                              buttonbuilder("0", 1, Colors.black45),
                              buttonbuilder("00", 1, Colors.black45),

                            ]

                        ),

                      ]
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                    ],
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width*0.25,

                    child: Table(
                      children: [
                        TableRow(
                         children: [
                           buttonbuilder("×", 1, Colors.blue),
                         ]
                        ),
                        TableRow(
                            children: [
                              buttonbuilder("-", 1, Colors.blue),
                            ]
                        ),
                        TableRow(
                            children: [
                              buttonbuilder("+", 1, Colors.blue),
                            ]
                        ),
                        TableRow(
                            children: [
                              buttonbuilder("=", 2, Colors.redAccent),
                            ]
                        ),
                      ],
                    )
                  )

                ],
              ),
            ],

          ),
        ),
      ),



    );
  }
}