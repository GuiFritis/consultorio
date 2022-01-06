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
        <div class="card">
            <div class="card-header text-center text-success">
                <h2 class="m-2">{{$msg}}</h2>
            </div>
                <div class="card-body">
                    <ul>
                        <li>Paciente   =>  {{$paciente->nome}}</li>
                        <li>Medico     =>  {{$medico->nome}}</li>
                        <li>Horário    =>  {{$consulta->horario}}</li>
                        <li>Motivo     =>  {{$consulta->motivo}}</li>
                        <li>Histórico  =>  {{$consulta->historico}}</li>
                        <li>Status     =>  {{$consulta->status}}</li>
                    </ul>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <a href="{{route('consulta.create')}}" class="btn btn-primary">Voltar</a>
                            </div>
                        </div>
                    </div>
                </div>    
        </div>
    </div>
    <footer class="bg-danger text-light text-center" style="position: fixed; bottom: 0px; width: 100%;">
        Consultório - Fritis
    </footer>
</body>
</html>