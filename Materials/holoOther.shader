Shader "Custom/holoOther"
{
    Properties
    {
        _HoloColor ("Hologram Color", Color) = (0,0,0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        zwrite on
        ztest always
        Stencil
        {
            Ref 1
            Comp equal
        }

        cull front
        CGPROGRAM
        #pragma surface surf Nolight vertex:vert noambient noshadow

        struct Input
        {
            float4 color:COLOR;
        };

        void vert (inout appdata_full v)
        {
            v.vertex.xyz = v.vertex.xyz + v.normal.xyz * 0.01;
        }
        
        void surf (Input IN, inout SurfaceOutput o)
        {

        }

        float4 LightingNolight(SurfaceOutput s, float3 lightDir, float atten)
        {
            return float4(1,1,1,0);
        }
        ENDCG

        cull back
        CGPROGRAM
        #pragma surface surf Lambert noambient

        float3 _HoloColor;

        struct Input
        {
            float4 color:COLOR;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Emission = _HoloColor;
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Transparent/Diffuse"
}