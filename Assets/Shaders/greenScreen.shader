Shader "Custom/greenScreen" {
	Properties {
		_MainTex ("Texture", 2D) = "black" { }
	}
        
	SubShader {
    	Pass {

    CGPROGRAM
// Upgrade NOTE: excluded shader from DX11 and Xbox360; has structs without semantics (struct v2f members sPos)
#pragma exclude_renderers d3d11 xbox360

    #pragma vertex vert
    #pragma fragment frag
    #include "UnityCG.cginc"
	
	sampler2D _MainTex;
	
    struct v2f {
        float4 pos : SV_POSITION;
        float4 sPos;
    };

    v2f vert (appdata_base v)
    {
        v2f o;
        o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
        o.sPos = o.pos;
        return o;
    }

    half4 frag (v2f i) : COLOR
    {
        half4 col = tex2D (_MainTex, .5*(i.sPos.xy / i.sPos.w)+float2(.5,.5));
        return col;
    }
    ENDCG

    	}
	}
}
