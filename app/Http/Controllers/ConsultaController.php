<?php

namespace App\Http\Controllers;

use App\Models\Consulta;
use App\Models\Medico;
use App\Models\Paciente;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ConsultaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $pacientes = Paciente::all(['id', 'nome', 'acesso'])->where('acesso', 'p');

        $medicos = Medico::all(['id', 'nome', 'acesso'])->where('acesso', 'm');
        
        return view("consulta/cadastro", ['medicos' => $medicos, 'pacientes' => $pacientes]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $msg = "";

        if(!$request->has('paciente') || empty($request->input('paciente'))){
            $msg .= "Selecione o paciente!<br/>";
        }
        if(!$request->has('medico') || empty($request->input('medico'))){
            $msg .= "Selecione o medico!<br/>";
        }
        if(!$request->has('data') || empty($request->input('data'))){
            $msg .= "Preencha o data!<br/>";
        }
        if(!$request->has('hora') || empty($request->input('hora'))){
            $msg .= "Preencha o hora!<br/>";
        }
        if(!$request->has('motivo') || empty($request->input('motivo'))){
            $msg .= "Preencha o motivo!<br/>";
        }
        if(!$request->has('status') || empty($request->input('status'))){
            $msg .= "Selecione o status!<br/>";
        }

        if(empty($msg)){
            $consulta = new Consulta();
            $consulta->paciente_id = $request->input('paciente');
            $consulta->medico_id = $request->input('medico');
            $consulta->horario = $request->input('data')." ".$request->input('hora');
            $consulta->motivo = $request->input('motivo');
            $consulta->historico = $request->input('historico');
            $consulta->status = $request->input('status');

            $consulta->save();

            $paciente = Paciente::findOrFail($consulta->paciente_id);
            $medico = Medico::find($consulta->medico_id);

            return view("consulta/detalhes", ['consulta' => $consulta, 
                    'msg' => "Consulta inserido com sucesso!",
                    'paciente' => $paciente,
                    'medico' => $medico
                ]);
        } else {
            return back()->withInput()->header('msg', $msg);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
