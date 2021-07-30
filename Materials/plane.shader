Shader "Custom/plane"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        cull off
        Stencil
        {
            Ref 1
            Comp always
            Pass replace
        }

        CGPROGRAM
        #pragma surface surf Lambert
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = float3(0, 0, 0);
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
