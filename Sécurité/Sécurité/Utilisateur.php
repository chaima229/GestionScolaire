<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    // Méthode pour créer un utilisateur
    public function create(Request $request)
    {
        // Validation des données d'entrée
        $validatedData = $request->validate([
            'nom' => 'required|max:255',
            'prenom' => 'required|max:255',
            'email' => 'required|email|unique:utilisateurs,email',
            'mot_de_passe' => 'required|min:8',
            'role' => ['required', Rule::in(['admin', 'utilisateur'])],
        ]);

        // Si la validation réussit, nous procédons à l'insertion dans la base de données
        try {
            DB::statement('
                CALL CreateUtilisateur(?, ?, ?, ?, ?)
            ', [
                $validatedData['nom'],
                $validatedData['prenom'],
                $validatedData['email'],
                bcrypt($validatedData['mot_de_passe']), // Utilisation de bcrypt pour sécuriser le mot de passe
                $validatedData['role']
            ]);

            return response()->json(['message' => 'Utilisateur créé avec succès!'], 201);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Erreur lors de la création de l\'utilisateur.'], 500);
        }
    }
}
