using UnityEngine;
using System.Collections;

public class playMov : MonoBehaviour {
	MovieTexture tex;

	// Use this for initialization
	void Start () {
		tex = (MovieTexture)renderer.material.mainTexture;
		tex.loop = true;
		tex.Play ();

		MovieTexture tex2 = (MovieTexture)renderer.material.GetTexture ("_BackTex");
		tex2.loop = true;
		tex2.Play ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
