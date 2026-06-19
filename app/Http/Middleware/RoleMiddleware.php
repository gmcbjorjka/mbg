<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * Role-based access control (RBAC)
     * super_admin | admin | beneficiary
     */
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        $user = $request->user();

        // kalau belum login
        if (!$user) {
            return response()->json([
                'message' => 'Unauthenticated'
            ], 401);
        }

        // cek role
        if (!in_array($user->role, $roles)) {
            return response()->json([
                'message' => 'Forbidden - role tidak diizinkan',
                'your_role' => $user->role,
                'required_role' => $roles
            ], 403);
        }

        return $next($request);
    }
}
