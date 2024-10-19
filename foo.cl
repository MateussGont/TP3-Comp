class Main inherits IO{

 pilha: Pilha;
 elemento_entrada: String;
 continua_loop: Bool <- true;
 itemTopo: String;
 numero1: Int;
 numero2: Int;
    elemento_topo: CelulaPilha;
 proximo_elemento: CelulaPilha;
 main() : Object {
  {
    pilha <- new Pilha;
    pilha.init();
    while continua_loop loop 
    {
     out_string(">");
    elemento_entrada <- ((new IO).in_string().concat(""));
    
    if elemento_entrada = "d" then 
    {
     pilha.imprimir(pilha);
    }
    else if elemento_entrada = "x" then
    {
     continua_loop <- false;
    }
    else if elemento_entrada = "e" then
    {
     validaConteudoPilha(pilha);
    }
    else
    {
     pilha.empilhar(elemento_entrada);
     pilha.obterTopoPilha().setInt();
    }
    fi fi fi;
       
    }
    pool;
    out_string("Fim da execução\n");

  }
 } ;
 validaConteudoPilha(pilha: Pilha): Object {
 {
  itemTopo <- pilha.obterTopoPilha().obterElemento();
  if itemTopo = "+" then
  {
      --desempilha o +
   pilha.desempilhar();

   numero1 <- a2i_aux(pilha.desempilhar().obterElemento());
   numero2 <- a2i_aux(pilha.desempilhar().obterElemento());

   pilha.empilhar(i2a(numero1 + numero2));
   
  }
     else if itemTopo = "s" then
  {
            --desempilha o s
   pilha.desempilhar();

   elemento_topo <- pilha.desempilhar();
   proximo_elemento <- pilha.desempilhar();

   pilha.empilhar(elemento_topo.obterElemento());
      pilha.empilhar(proximo_elemento.obterElemento());

  }
  else if pilha.pilhaVazia() then
  {
            out_string("Pilha Vazia\n");
  }
  else
  { 
   false;
  }

  fi fi fi;
  true;
 }

 };

 --Converte inteiro em string

    i2a(i : Int) : String {
 if i = 0 then "0" else 
        if 0 < i then i2a_aux(i) else
          "-".concat(i2a_aux(i * ~1)) 
        fi fi
    };
    i2a_aux(i : Int) : String {
        if i = 0 then "" else 
     (let next : Int <- i / 10 in
  i2a_aux(next).concat(intToString(i - next * 10))
     )
        fi
    };

    intToString(i: Int): String { 
 {
  if i = 0 then "0" else
  if i = 1 then "1" else
  if i = 2 then "2" else
        if i = 3 then "3" else
        if i = 4 then "4" else
        if i = 5 then "5" else
        if i = 6 then "6" else
        if i = 7 then "7" else
        if i = 8 then "8" else
        if i = 9 then "9" else "0"
         
        fi fi fi fi fi fi fi fi fi fi;
 }
 };

 --Converte string em inteiro
    a2i_aux(s : String) : Int {
 (let int : Int <- 0 in
  { 
         (let j : Int <- s.length() in
            (let i : Int <- 0 in
         while i < j loop
     {
         int <- int * 10 + c2i(s.substr(i,1));
         i <- i + 1;
     }
        pool
        )
        );
        int;
     }
        )
    };
    c2i(char : String) : Int {
  if char = "0" then 0 else
  if char = "1" then 1 else
  if char = "2" then 2 else
        if char = "3" then 3 else
        if char = "4" then 4 else
        if char = "5" then 5 else
        if char = "6" then 6 else
        if char = "7" then 7 else
        if char = "8" then 8 else
        if char = "9" then 9 else
        0
  
        fi fi fi fi fi fi fi fi fi fi
    };
 a2i(s : String) : Int {
        if s.length() = 0 then 0 else
  if s.substr(0,1) = "-" then ~a2i_aux(s.substr(1,s.length()-1)) else
        if s.substr(0,1) = "+" then a2i_aux(s.substr(1,s.length()-1)) else
           a2i_aux(s)
        fi fi fi
    };

} ;

class CelulaPilha {

 elemento: String;
 proximo_elemento: CelulaPilha;
 vazio: CelulaPilha;
 isInt: Bool <- false;
 isInt(): Bool {
  {
   isInt;
  }  
 };
 setInt(): Bool {
  {
   isInt = true;
  }
 };
 init(texto: String): CelulaPilha{
  { 
   elemento <- texto;
   proximo_elemento <- vazio; 
   self;
  }  
 };
 obterProximo(): CelulaPilha{
  {
   proximo_elemento;
  }
 };
 setProximo(novo: CelulaPilha): CelulaPilha{
  {
   proximo_elemento <- novo;
   proximo_elemento;
  }
 };
 setElemento(novo: String): CelulaPilha{
  {
   elemento <- novo;
   self;
  }
 };
 obterElemento(): String{
  {
   elemento;
  }
 };
 sair: Bool <- true;

};

class Pilha inherits IO{

 fundo: CelulaPilha;
 elemento_topo: CelulaPilha;
 aux: CelulaPilha;
 vazio: CelulaPilha;
 topoAux: CelulaPilha;
 sair: Bool <- true;
 cont: Int;

 obterElemento(): String{
  {
   elemento_topo.obterElemento();
  }
 };
 obterTopoPilha(): CelulaPilha{
  {
   elemento_topo;
  }
 };
 init(): Pilha{
  {
   aux <- new CelulaPilha;
   fundo <- aux;
   elemento_topo <- aux;
   self;
  }
 };
 empilhar(l: String): Object {
  {
   aux <- new CelulaPilha;
   aux.setProximo(elemento_topo);
   aux.setElemento(l);
   elemento_topo <- aux; 
   self;
  }
 };
 desempilhar(): CelulaPilha {
  {
   aux <- new CelulaPilha;
   aux <- obterTopoPilha();
   elemento_topo <- elemento_topo.obterProximo();
   aux;
  }
 };
 imprimir(pilha: Pilha): Bool {
  {
   topoAux <- pilha.obterTopoPilha();
   while sair loop
   {
    if topoAux.obterElemento() = "" then
     sair <- false
    else 
    {
     out_string("".concat(topoAux.obterElemento()).concat("\n"));
     
     topoAux <- topoAux.obterProximo();
    }
    fi;
   }
   pool;
   sair <- true;
   true;
  }
 };

 pilhaVazia(): Bool{
  
  if elemento_topo = fundo then 
   true
  
  else false
  fi
  
 };
};
