﻿package com.app{	import flash.display.MovieClip;	import flash.events.MouseEvent;	import flash.events.Event;/*código shufle arrayvar num_cards:Number = 5;var num_tiles:Number = 20;var numbers:Array = new Array();var cards:Array   = new Array();var c:Number = 0;for (var j=0; j<num_cards; j++) {	cards[j] = new Array();	for (var k=0; k<num_tiles; k++) {		c++;		numbers.push(c);	}}while (numbers.length > 0) {	var index:Number = Math.floor( Math.random() * numbers.length - 1 )	cards[numbers.length%num_cards].push(numbers.splice(index, 1));}for (var i=0; i<cards.length; i++) {	cards[i].sort(Array.NUMERIC);	trace (cards[i]);}*/	public class Card extends MovieClip	{		var numeros:uint = 25;		var numeracion:Array = [];		var cardNumbers:Array = [];		var celdas:Array = [];		var filas:Object={		B:[],		I:[],		N:[],		G:[],		O:[]		};		public function Card()		{			// constructor code			var currentX = 36.25;			var currentY = 109.2;			var i:uint = 0;			for (i=0; i < 99; i++)			{				numeracion.push(Globals.randomInt(1,99));			}			for (i=0; i < numeros; i++)			{				cardNumbers.push(numeracion.shift());			}			for (i=0; i < numeros; i++)			{				var cell:Cell= new Cell();				cell.numero.text = cardNumbers[i];				cell.x = currentX;				cell.y= currentY				;				if (currentX <= 205.75)				{					currentX +=  56.5;				}				else				{					currentX = 36.25;					currentY +=  56.5;				}				//despues hay que depurar esta opcion				switch (Globals.vars.totalUsers)				{					case 1 :						cell.numero.textColor = 0xA54600;						break;					case 2 :						cell.numero.textColor = 0x003D36;						break;					case 3 :						cell.numero.textColor = 0x3E5900;						break;					case 4 :						cell.numero.textColor = 0xA70039;						break;					case 5 :						cell.numero.textColor = 0x470002;						break;				}				if (i!=12)				{					addChild(cell);					cell.addEventListener(MouseEvent.CLICK, selectNumber);				}			}			switch (Globals.vars.totalUsers)			{				case 1 :					x = 1281;					y = 605;					gotoAndPlay('yellow');					break;				case 2 :					x = 571;					y = 605;					gotoAndPlay('blue');					break;				case 3 :					x = 473;					y = 365;					rotation = 90;					gotoAndPlay('green');					break;				case 4 :					x = 918;					y = 479;					rotation = 180;					gotoAndPlay('pink');					break;				case 5 :					x = 1630;					y = 479;					rotation = 180;					gotoAndPlay('red');					break;			}		}		function selectNumber(e:Event):void		{			var clickNum:uint = e.currentTarget.numero.text;			var wichCell = e.currentTarget.parent.getChildIndex(e.currentTarget);			if (Globals.vars.gameInited /*&& clickNum == Globals.vars.numero*/)			{				// agrega a las filas en caso de hacer un alinea horizontal				if (wichCell < 6)				{					(filas.B.length < 5)? filas.B.push(wichCell): false;					(filas.B.length == 5)? bonus() : false;				}				if (wichCell > 5 && wichCell < 11)				{					(filas.I.length < 5)? filas.I.push(wichCell) : bonus();					(filas.I.length == 5)? bonus() : false;				}				if (wichCell > 10 && wichCell < 15)				{					(filas.N.length < 4)? filas.N.push(wichCell) : bonus();					(filas.N.length == 4)? bonus() : false;				}				if (wichCell > 14 && wichCell < 20)				{					(filas.G.length < 5)? filas.G.push(wichCell) : bonus();					(filas.G.length == 5)? bonus() : false;				}				if (wichCell > 19 && wichCell < 25)				{					(filas.O.length < 5)? filas.O.push(wichCell) : bonus();					(filas.O.length == 5)? bonus() : false;				}				e.currentTarget.gotoAndPlay('selected');				e.currentTarget.removeEventListener(MouseEvent.CLICK, selectNumber);				celdas.push(clickNum);				checkWinner();			}		}		public function bonus():void		{			trace('BINGO !!');		}		public function checkWinner():void		{			if (celdas.length >= 24)			{				var alerta:Console= new Console("winner");				parent.addChild(alerta);			}		}	}}