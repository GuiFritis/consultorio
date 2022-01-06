<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultório</title>
    <link rel="icon" type="image/png" href="/img/favicon.png"  />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
</head>
<body>
    <header>
        <nav class="nav text-center bg-danger align-middle py-2">
            <img src="/img/logo.png" alt="Logo" height="50px"/>
        </nav>
    </header>
    <div class="container template mb-5">
        <span>{{header('msg')}}</span>
        <form action="{{route('consulta.store')}}" method="POST">
        @csrf
        <div class="card">
            <div class="card-header text-center">
                <h2 class="m-2">Cadastrar Consulta</h2>
            </div>
                <div class="card-body">
                    <div class="col-xs-12 form-group">
                        <label for="paciente" class="control-label">Paciente:</label>
                        <select name="paciente" id="paciente" class="form-control" required>
                            <option value="">Paciente</option>
                            @foreach ($pacientes as $value)                                
                                <option value="{{$value->id}}" {{old('paciente')==$value->id?'selected':NULL}}>{{$value->nome}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-xs-12 form-group">
                        <label for="medico" class="control-label">Médico:</label>
                        <select name="medico" id="medico" class="form-control" {{old('medico')}}>
                            <option value="">Medico</option>
                            @foreach ($medicos as $value)                                
                                <option value="{{$value->id}}" {{old('medico')==$value->id?'selected':NULL}}>{{$value->nome}}</option>
                            @endforeach
                        </select>  
                    </div>
                    <div class="row col-xs-12">
                        <div class="col-xs-6 form-group">
                            <label for="data" class="control-label">Data:</label>
                            <input type="date" class="form-control" name="data" id="data" placeholder="__/__/____" 
                                min="<?=date("Y-m-d")?>" value="{{old('data')}}" required/>
                        </div>
                        <div class="col-xs-6 form-group">
                            <label for="hora" class="control-label">Hora:</label>
                            <input type="time" class="form-control" name="hora" id="horario" placeholer="__:__" 
                                value="{{old('hora')}}" required/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <label for="motivo" class="control-label">Motivo:</label>
                        <input name="motivo" id="motivo" class="form-control" maxlength="45" 
                            value="{{old('motivo')}}" required/>
                    </div>
                    <div class="col-xs-12 form-group">
                        <label for="historico" class="control-label">Histórico:</label>
                        <textarea name="historico" id="historico" class="form-control" maxlength="255">
                            {{old('historico')}}
                        </textarea>
                    </div>
                    <div class="col-xs-12 form-group">
                        <label for="status" class="control-label">Status</label>
                        <select name="status" id="status" class="form-control" required>
                            <option value="">Status</option>
                            <option value="Agendado" {{old('agendado')=="Agendado"?"Selected":NULL}}>
                                Agendado
                            </option>
                            <option value="Realizado" {{old('agendado')=="Realizado"?"Selected":NULL}}>
                                Realizado
                            </option>
                            <option value="Retorno" {{old('agendado')=="Retorno"?"Selected":NULL}}>
                                Retorno
                            </option>
                            <option value="Cancelado" {{old('agendado')=="Cancelado"?"Selected":NULL}}>
                                Cancelado
                            </option>
                        </select>
                    </div>            
                </div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <button class="btn btn-danger" name="action" value="insert">Salvar</button>
                            </div>
                        </div>
                    </div>
                </div>    
        </div>
        </form>
    </div>
    <footer class="bg-danger text-light text-center" style="position: fixed; bottom: 0px; width: 100%;">
        Consultório - Fritis
    </footer>
</body>
</html>